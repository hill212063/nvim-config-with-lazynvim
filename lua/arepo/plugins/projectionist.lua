return {
	"tpope/vim-projectionist",
}

-- Demo java project
--
-- name: .projectionist.json
-- noted: {Test} look like it exclude Test postfix in filename idk why
--
--  {
--   "src/main/java/*.java": {
--     "alternate": "src/test/java/{}Test.java",
--     "type": "source"
--   },
--   "src/test/java/*.java": {
--     "alternate": "src/main/java/{}{Test}.java",
--     "type": "test"
--   },
--   "*.java": {"dispatch": "javac {file}"},
--   "*": {"make": "gradlew"}
-- }
