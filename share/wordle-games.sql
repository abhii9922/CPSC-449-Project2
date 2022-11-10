PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS valid_words;
DROP TABLE IF EXISTS game_history;
DROP TABLE IF EXISTS game_states;
DROP TABLE IF EXISTS games;


CREATE TABLE games (
    game_id TEXT NOT NULL,
    secret_word TEXT NOT NULL,
    username TEXT NOT NULL,
    PRIMARY KEY(game_id)
);

CREATE TABLE game_states (
    game_id INTEGER NOT NULL,
    remaining_guesses TINYINT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE game_history (
    game_id INTEGER NOT NULL,
    guess TEXT NOT NULL,
    remaining_guesses TINYINT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE valid_words (
    word TEXT NOT NULL,
    correct_word BOOLEAN NOT NULL,
    PRIMARY KEY(word)
);

CREATE INDEX game_states_gameidx ON game_states(game_id);
CREATE INDEX games_usridx on games(username);

INSERT INTO games VALUES (1, "cigar", "john");
INSERT INTO game_states VALUES (1, 2, "In Progress");
INSERT INTO game_history VALUES (1, "cited", 5);
INSERT INTO game_history VALUES (1, "amice", 4);
INSERT INTO game_history VALUES (1, "baccy", 3);
INSERT INTO game_history VALUES (1, "aglet", 2);
INSERT INTO games VALUES (2, "rebut", "john");
INSERT INTO game_states VALUES (2, 0, "lost");
INSERT INTO game_history VALUES (2, "aahed", 5);
INSERT INTO game_history VALUES (2, "aalii", 4);
INSERT INTO game_history VALUES (2, "aapas", 3);
INSERT INTO game_history VALUES (2, "aargh", 2);
INSERT INTO game_history VALUES (2, "aarti", 1);
INSERT INTO game_history VALUES (2, "abaca", 0);
INSERT INTO games VALUES (3, "sissy", "john");
INSERT INTO game_states VALUES (3, 5, "won");
INSERT INTO game_history VALUES (3, "sissy", 5);
INSERT INTO games VALUES (4, "humph", "john");
INSERT INTO game_states VALUES (4, 5, "In Progress");
INSERT INTO game_history VALUES (4, "bahus", 5);


COMMIT;
