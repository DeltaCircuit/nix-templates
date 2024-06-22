{
  description = "Collection of my flakes which I regularly use (and update)";

  outputs = _: {
    templates = {
      python = {
        path = ./python;
        description = "Python 3.11 with pip and venv";
      };
    };
  };
}
