import json

class Config():
    def pegar_valor_json(self,data):
        json_file = open("./Infra/Config/config.json")

        response = json.load(json_file)
        return response[data]