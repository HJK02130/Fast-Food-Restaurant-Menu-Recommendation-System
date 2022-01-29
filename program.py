import tkinter as tk
import pymysql
import random

conn, cur = None, None
data1, data2, data3, data4, data5, data6 = "", "", "", "", "", ""
sql=""

conn = pymysql.connect(host='127.0.0.1', user='root', password='579579', db='db_2018102102', charset='utf8')

cur = conn.cursor()

######## drink 테이블에 데이터 추가 ########
while(True):
    # drink ID가 NULL이면 데이터 추가 취소
    print("음료 메뉴 추가를 원하지 않으시다면 Enter를 눌러주세요.")
    data1 = input("drink ID(INT) ==> ")
    if data1 == "":
        break;
    data2 = input("drink name(VARCHAR) ==> ")
    data3 = input("drink price(INT) ==> ")
    data4 = input("drink calorie(INT) ==> ")
    data5 = input("drink carbonated(CHAR) ==> ")
    data6 = input("drink discount(VARCHAR) ==> ")

    sql = "INSERT INTO drink VALUES('" + data1 + "','" + data2 + "','" + data3 + "','" + data4 + "','" + data5 + "'," + data6 + ")"
    cur.execute(sql)
conn.commit()

######## food 테이블에 데이터 추가 ########
while(True):
    # burger ID가 NULL이면 데이터 추가 취소
    print("음식 메뉴 추가를 원하지 않으시다면 Enter를 눌러주세요.")
    data1 = input("burger ID(INT) ==> ")
    if data1 == "":
        break;
    data2 = input("food name(VARHCAR) ==> ")
    data3 = input("price(INT) ==> ")
    data4 = input("calorie(INT) ==> ")
    data5 = input("vegetable(VARCHAR) ==> ")
    data6 = input("discount(VARCHAR) ==> ")

    sql = "INSERT INTO food VALUES('" + data1 + "','" + data2 + "','" + data3 + "','" + data4 + "','" + data5 + "'," + data6 + ")"
    cur.execute(sql)
conn.commit()

######## 테스트를 위한 user 테이블에 사용자 추가 ########
while(True):
    # user ID가 NULL이면 데이터 추가 취소
    print("테스트 사용자 추가를 원하지 않으시다면 Enter를 눌러주세요.")
    data1 = input("user ID(INT) ==> ")
    if data1 == "":
        print("***사용자를 위한 패스트푸드 메뉴 추천 프로그램이 켜졌습니다***")
        print("※음식 추천과 음료 추천을 모두 받고 싶으시면 음식 추천 후 화면을 닫고 다시 프로그램을 실행하여 음료 추천을 받으시길 바랍니다.")
        print("※에러 시, 추천 드릴 메뉴가 없는 것이니, 창을 닫고 다시 실행해주시길 바랍니다.")
        break;
    data2 = input("user name(VARHCAR) ==> ")
    data3 = input("phone(VARCHAR) ==> ")

    sql = "INSERT INTO user VALUES('" + data1 + "','" + data2 + "'," + data3 + ")"
    cur.execute(sql)
conn.commit()

######## 추천 시스템 ON ########
win=tk.Tk()
win.title("메뉴 추천 프로그램")
win.geometry("500x400+500+100")
win.resizable(False, False)
win.option_add("*Font", "Arial 12")

######## 음식 메뉴 추천 ########
def show_meal():
    btn_meal.configure(bg="yellow")
    btn_drink.configure(bg="white")
    btn_history.configure(bg="white")

    lab1 = tk.Label(win)
    lab1.config(text="가격")
    lab1.pack()
    ent1 = tk.Entry(win)
    ent1.insert(0,"입력가격 이하로 추천")
    def clear(event):
        if ent1.get() == "입력가격 이하로 추천":
            ent1.delete(0, len(ent1.get()))
    ent1.bind("<Button-1>", clear)
    ent1.pack()
    lab2 = tk.Label(win)
    lab2.config(text="칼로리")
    lab2.pack()
    ent2 = tk.Entry(win)
    ent2.insert(0,"입력한 칼로리 이하로 추천")
    def clear(event):
        if ent2.get() == "입력한 칼로리 이하로 추천":
            ent2.delete(0, len(ent2.get()))
    ent2.bind("<Button-1>", clear)
    ent2.pack()
    lab3 = tk.Label(win)
    lab3.config(text="채소 유무")
    lab3.pack()
    ent3 = tk.Entry(win)
    ent3.insert(0,"유:1, 무:0 입력")
    def clear(event):
        if ent3.get() == "유:1, 무:0 입력":
            ent3.delete(0, len(ent3.get()))
    ent3.bind("<Button-1>", clear)
    ent3.pack()
    lab4 = tk.Label(win)
    lab4.config(text="할인메뉴 여부")
    lab4.pack()
    ent4 = tk.Entry(win)
    ent4.insert(0,"할인:1, 할인X:0 입력")
    def clear(event):
        if ent4.get() == "할인:1, 할인X:0 입력":
            ent4.delete(0, len(ent4.get()))
    ent4.bind("<Button-1>", clear)
    ent4.pack()

    def ent_p():
        a = ent1.get() #
        b = ent2.get() #
        c = ent3.get() #
        d = ent4.get() #
        print(a+b+c+d)

        cur.execute("SELECT * FROM food WHERE price <= %s AND calorie <= %s AND vegetable = %s AND discount = %s", (a, b, c, d))
        row = cur.fetchall()
        print(row)
        rcmd = random.choice(row)
        list_rcmd = list(rcmd)
        print(list_rcmd[1])

        lab = tk.Label(win) #
        lab.pack() #
        lab.config(text = "\n" + list_rcmd[1] + "를(을) 추천드립니다!") #

    btn = tk.Button(win)
    btn.config(text = "추천받기", command = ent_p)
    btn.pack()

######## 음료 메뉴 추천 ########
def show_drink():
    btn_meal.configure(bg="white")
    btn_drink.configure(bg="yellow")
    btn_history.configure(bg="white")
    lab1 = tk.Label(win)
    lab1.config(text="가격")
    lab1.pack()
    ent1 = tk.Entry(win)
    ent1.insert(0,"입력가격 이하로 추천")
    def clear(event):
        if ent1.get() == "입력가격 이하로 추천":
            ent1.delete(0, len(ent1.get()))
    ent1.bind("<Button-1>", clear)
    ent1.pack()
    lab2 = tk.Label(win)
    lab2.config(text="칼로리")
    lab2.pack()
    ent2 = tk.Entry(win)
    ent2.insert(0,"입력한 칼로리 이하로 추천")
    def clear(event):
        if ent2.get() == "입력한 칼로리 이하로 추천":
            ent2.delete(0, len(ent2.get()))
    ent2.bind("<Button-1>", clear)
    ent2.pack()
    lab3 = tk.Label(win)
    lab3.config(text="탄산 유무")
    lab3.pack()
    ent3 = tk.Entry(win)
    ent3.insert(0,"유:1, 무:0 입력")
    def clear(event):
        if ent3.get() == "유:1, 무:0 입력":
            ent3.delete(0, len(ent3.get()))
    ent3.bind("<Button-1>", clear)
    ent3.pack()
    lab4 = tk.Label(win)
    lab4.config(text="할인메뉴 여부")
    lab4.pack()
    ent4 = tk.Entry(win)
    ent4.insert(0,"할인:1, 할인X:0 입력")
    def clear(event):
        if ent4.get() == "할인:1, 할인X:0 입력":
            ent4.delete(0, len(ent4.get()))
    ent4.bind("<Button-1>", clear)
    ent4.pack()

    def ent_p():
        a = ent1.get() #
        b = ent2.get() #
        c = ent3.get() #
        d = ent4.get() #
        print(a+b+c+d)

        cur.execute("SELECT * FROM drink WHERE price <= %s AND calorie <= %s AND carbonated = %s AND dicount = %s", (a, b, c, d))
        row = cur.fetchall()
        print(row)
        rcmd = random.choice(row)
        list_rcmd = list(rcmd)
        print(list_rcmd[1])

        lab = tk.Label(win) #
        lab.pack() #
        lab.config(text = "\n" + list_rcmd[1] + "를(을) 추천드립니다!") #

    btn = tk.Button(win)
    btn.config(text = "추천받기", command = ent_p)
    btn.pack()

######## 사용자 주문내역 조회 ########
def show_history():
    btn_meal.configure(bg="white")
    btn_drink.configure(bg="white")
    btn_history.configure(bg="yellow")
    lab1 = tk.Label(win)
    lab1.config(text="이름")
    lab1.pack()
    ent1 = tk.Entry(win)
    ent1.insert(0,"이름을 입력하세요.")
    def clear(event):
        if ent1.get() == "이름을 입력하세요.":
            ent1.delete(0, len(ent1.get()))
    ent1.bind("<Button-1>", clear)
    ent1.pack()
    lab2 = tk.Label(win)
    lab2.config(text="전화번호 (맨 앞 0 제외)")
    lab2.pack()
    ent2 = tk.Entry(win)
    ent2.insert(0,"번호를 입력하세요.")
    def clear(event):
        if ent2.get() == "번호를 입력하세요.":
            ent2.delete(0, len(ent2.get()))
    ent2.bind("<Button-1>", clear)
    ent2.pack()

    def ent_p():
        a = ent1.get() #
        b = ent2.get() #
        #c = ent3.get() #
        #d = ent4.get() #
        print(a+b)

        id = cur.execute("SELECT user_id FROM user WHERE user_name <= %s AND phone <= %s", (a, b))
        cur.execute("SELECT menu_info FROM history WHERE user_user_id <= %s", (id))
        row = cur.fetchone()
        rcmd=row[0]
        print(rcmd)

        lab = tk.Label(win) #
        lab.pack() #
        lab.config(text = "\n" + a + "님의 가장 최근 주문 내역입니다." + "\n\n[" + rcmd + "]") #

    btn = tk.Button(win)
    btn.config(text = "조회하기", command = ent_p)
    btn.pack()

# 식사와 음료 버튼이 있는 곳
frame1 = tk.Frame(win, width="600", height="10")
frame1.pack(fill="both")

btn_meal = tk.Button(frame1, text="음식추천", padx="10", pady="10", bg="white", command=show_meal)
btn_meal.grid(row=0, column=0, padx=10, pady=10)
btn_drink = tk.Button(frame1, text="음료추천", padx="10", pady="10", bg="white", command=show_drink)
btn_drink.grid(row=0, column=1, padx=10, pady=10)
btn_history = tk.Button(frame1, text="내 주문내역 조회", padx="10", pady="10", bg="white", command=show_history)
btn_history.grid(row=0, column=2, padx=10, pady=10)

win.mainloop()