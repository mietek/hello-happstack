import Happstack.Lite
import System.Environment

main :: IO ()
main = do
    env <- getEnvironment
    let port_ = maybe 8080 read $ lookup "PORT" env
        config = defaultServerConfig { port = port_ }
    serve (Just config) $
      ok $ toResponse "Hello, world!"
