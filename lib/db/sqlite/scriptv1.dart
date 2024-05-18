final createTableFuncionario = '''
    CREATE TABLE IF NOT EXISTS usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
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

final createTableFuncionarioTreinamento = '''
    CREATE TABLE IF NOT EXISTS funcionario_treinamento (
        funcionario_id INTEGER,
        treinamento_id INTEGER,
        PRIMARY KEY (funcionario_id, treinamento_id),
        FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
        FOREIGN KEY (treinamento_id) REFERENCES treinamento(id)
    )
''';
