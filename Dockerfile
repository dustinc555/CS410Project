FROM jupyter/base-notebook

ENV PYTHONDONTWRITEBYTECODE=true
EXPOSE 8888

# Install packages in smaller groups for better dependency resolution with Conda
RUN pip install pandas tqdm scikit-learn
RUN pip install ipywidgets kaggle
RUN pip install matplotlib nltk
RUN pip install networkx

RUN echo 'alias_magic clingo script -p "clingo --no-raise-error"' \
    >> `ipython locate profile`/startup/config.ipy

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]