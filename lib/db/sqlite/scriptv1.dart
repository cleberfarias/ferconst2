final createTableUsuario = '''
    CREATE TABLE IF NOT EXISTS usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        senha TEXT NOT NULL,
        setor TEXT NOT NULL,
        cargo TEXT NOT NULL,
        inscricao TEXT NOT NULL
    )
''';

final createTableTreinamento = '''
    CREATE TABLE IF NOT EXISTS treinamento (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL UNIQUE,
        classificacao TEXT,
        inicio TEXT NOT NULL,
        fim TEXT,
        descricao TEXT
        
    )
''';

final createTableUsuarioTreinamento = '''
    CREATE TABLE IF NOT EXISTS usuario_treinamento (
        usuario_id INTEGER,
        treinamento_id INTEGER,
        PRIMARY KEY (usuario_id, treinamento_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario(id),
        FOREIGN KEY (treinamento_id) REFERENCES treinamento(id)
    )
''';
