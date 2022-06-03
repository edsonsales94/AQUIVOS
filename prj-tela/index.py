from cProfile import label
from cgitb import text
from doctest import master
from tkinter import*
from turtle import left

class Application:
    def __init__(self, Master=None):
        self.widget1 = Frame(master)
        self.widget1.pack()
        self.msg = Label(self.widget1, text="primeiro")
        self.msg.pack()
        self.msg["font"] = ("verdana", "10" ,"italic","bold")
        self.msg.pack()
        self.sair = Button(self.widget1)
        self.sair["text"] = "Sair"
        self.sair["font"] = ("calibri","10")
        self.sair["width"] = 5
        self.sair["command"] = self.widget1.quit
        self.sair.pack(side="right")

root = Tk()
Application(root)
root.mainloop()