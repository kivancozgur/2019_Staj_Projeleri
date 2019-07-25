
import 'dart:convert';
Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

String pokedexToJson(Pokedex data) => json.encode(data.toJson());

class Pokedex {
    List<Pokemon> pokemon;

    Pokedex({
        this.pokemon,
    });

    factory Pokedex.fromJson(Map<String, dynamic> json) => new Pokedex(
        pokemon: new List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pokemon": new List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class Pokemon {
    int id;
    String num;
    String name;
    String img;
    List<String> type;
    String height;
    String weight;
    String candy;
    int candyCount;
    String egg;
    double spawnChance;
    double avgSpawns;
    String spawnTime;
    List<double> multipliers;
    List<String> weaknesses;
    List<Evolution> nextEvolution;
    List<Evolution> prevEvolution;

    Pokemon({
        this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.multipliers,
        this.weaknesses,
        this.nextEvolution,
        this.prevEvolution,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => new Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: new List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"],
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null ? null : new List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: new List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: json["next_evolution"] == null ? null : new List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null ? null : new List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": new List<dynamic>.from(type.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount == null ? null : candyCount,
        "egg": egg,
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null ? null : new List<dynamic>.from(multipliers.map((x) => x)),
        "weaknesses": new List<dynamic>.from(weaknesses.map((x) => x)),
        "next_evolution": nextEvolution == null ? null : new List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
        "prev_evolution": prevEvolution == null ? null : new List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
    };
}

class Evolution {
    String num;
    String name;

    Evolution({
        this.num,
        this.name,
    });

    factory Evolution.fromJson(Map<String, dynamic> json) => new Evolution(
        num: json["num"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
    };
}
