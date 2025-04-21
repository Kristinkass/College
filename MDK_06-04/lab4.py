from docx import Document

# Функция для извлечения данных из анкеты
def extract_data_from_form(docx_file):
    doc = Document(docx_file)
    data = {
        "жанры": [],
        "платформы": [],
        "рейтинг": None,
        "год": None
    }

    for para in doc.paragraphs:
        text = para.text.strip()

        if text.startswith("☑"):
            value = text[1:].strip().lower()
            if value in ["комедия", "драма", "фэнтези", "хоррор", "фантастика", "экшн", "приключения", "семейный", "триллер"]:
                data["жанры"].append(value)
            elif value in ["netflix", "kinopoisk", "okko"]:
                data["платформы"].append(value)

        elif text.replace('.', '', 1).isdigit():
            number = float(text)
            if not data["рейтинг"]:
                data["рейтинг"] = number
            elif not data["год"]:
                data["год"] = int(number)

    return data

# Продукционные правила
def apply_rules(user_data):
    recommendations = []

    genres = user_data["жанры"]
    platform = user_data["платформы"][0] if user_data["платформы"] else ""
    rating = user_data["рейтинг"] or 0
    year = user_data["год"] or 0

    # Продукционные правила
    if "комедия" in genres:
        recommendations.append("Один дома")
    if "хоррор" in genres:
        recommendations.append("Оно")
    if "приключения" in genres:
        recommendations.append("Ночь в музее")
    if "фэнтези" in genres and rating > 7.5:
        recommendations.append("Гарри Поттер")
    if "экшн" in genres and platform == "netflix" and year >= 2010:
        recommendations.append("Бегущий в лабиринте")
    if "драма" in genres:
        recommendations.append("Дьявол носит Prada")
    if "семейный" in genres:
        recommendations.extend(["Один дома", "Ночь в музее"])
    if platform == "kinopoisk" and "приключения" in genres and rating > 8:
        recommendations.append("Интерстеллар")

    return list(set(recommendations)) or ["Фильмы не найдены по заданным критериям."]

# Точка входа
if __name__ == "__main__":
    file_path = "Анкета_по_фильмам.docx"
    data = extract_data_from_form(file_path)
    print("Извлечённые данные:", data)

    result = apply_rules(data)
    print("\n Рекомендуемые фильмы:")
    for film in result:
        print(f"- {film}")
