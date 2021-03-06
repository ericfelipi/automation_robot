import random

class Signup():

    def sortear_nome(self):
        txt_names = open("./Infra/WordLists/names.txt", encoding="utf8")
        list_names = txt_names.readlines()
        return random.choice(list_names).rstrip("\n")    

    def sortear_sobrenome(self):
        txt_lastnames = open("./Infra/WordLists/lastnames.txt", encoding="utf8")
        list_lastnames = txt_lastnames.readlines()
        return random.choice(list_lastnames).rstrip("\n")

    def sortear_email(self):
        emails=['gmail','outlook','protonmail','bing','yahoo','hotmail']
        
        nome = self.sortear_nome()
        name = nome.lower()
        sobrenome = self.sortear_sobrenome()
        lastname = sobrenome.lower()
        email = random.choice(emails)

        email_return = (name + lastname + '@'+email+'.com')
        return email_return