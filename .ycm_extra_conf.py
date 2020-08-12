""" Vim YouCompleteMe"""
import pathlib

def Settings(**kwargs):
  return {
    "interpreter_path": pathlib.Path(__file__)
      .parent.absolute()
      .joinpath(".venv/bin/python"),
    "sys_path": [
      pathlib.Path(__file__)
        .parent.absolute()
        .joinpath("py_friends_and_strangers")
    ]
  }
