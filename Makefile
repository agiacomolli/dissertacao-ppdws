PROJECT       = diss
OUTPUT        = soa-ims
OUTPUT_FORMAT = pdf
OUTPUT_DIR    = build

BIBLIOGRAPHY  = bibliography/biblio.bib
ACRONYMS      = glossary/abreviaturas.tex
SYMBOLS       = glossary/simbolos.tex

CHAPTERS = \
  chapters/resumo.tex \
  chapters/abstract.tex \
  chapters/introducao.tex \
  chapters/sistemas-de-manutencao-inteligente.tex \
  chapters/arquiteturas-orientadas-a-servicos.tex \
  chapters/proposta-de-arquitetura.tex \
  chapters/implementacao-e-resultados.tex \
  chapters/conclusao.tex

IMAGES = \
	images/soa-proposed-architecture.svg \
	images/device-services-overview.svg \
	images/uml-discovery-setup-devices.svg \
	images/uml-analysis-create.svg

TABLES = #\

SOURCES = #\

LATEX     = lualatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

OUTPUT_FILE   = $(OUTPUT_DIR)/$(OUTPUT).$(OUTPUT_FORMAT)
PROJECT_FILE  = $(PROJECT).tex

all: project

project: builddir document

builddir:
	@mkdir -p $(OUTPUT_DIR)

document: images $(BIBLIOGRAPHY) $(ACRONYMS) $(SYMBOLS) $(CHAPTERS) $(PROJECT_FILE)
	$(LATEX) --output-format=$(OUTPUT_FORMAT) --output-directory=$(OUTPUT_DIR) \
			--jobname=$(OUTPUT) $(PROJECT_FILE)
ifneq ($(BIBLIOGRAPHY),)
	@$(BIBTEX) $(OUTPUT_DIR)/$(OUTPUT)
	$(LATEX) --output-format=$(OUTPUT_FORMAT) --output-directory=$(OUTPUT_DIR) \
			--jobname=$(OUTPUT) $(PROJECT_FILE)
endif
ifneq ($(ACRONYMS),)
	$(MAKEINDEX) -s $(OUTPUT_DIR)/$(OUTPUT).ist -t $(OUTPUT_DIR)/$(OUTPUT).alg \
			-o $(OUTPUT_DIR)/$(OUTPUT).acr $(OUTPUT_DIR)/$(OUTPUT).acn
endif
ifneq ($(SYMBOLS),)
	$(MAKEINDEX) -s $(OUTPUT_DIR)/$(OUTPUT).ist -t $(OUTPUT_DIR)/$(OUTPUT).slg \
			-o $(OUTPUT_DIR)/$(OUTPUT).sym $(OUTPUT_DIR)/$(OUTPUT).sbl
endif
	$(LATEX) --output-format=$(OUTPUT_FORMAT) --output-directory=$(OUTPUT_DIR) \
			--jobname=$(OUTPUT) $(PROJECT_FILE)

images: $(IMAGES:.svg=.pdf)

%.pdf: %.svg
	@echo Convertendo $^ para $@
	@inkscape -D $^ -A $@

clean:
	@rm -rf $(IMAGES_DIR)/*.pdf
	@find $(OUTPUT_DIR) -type f -not -name "$(OUTPUT).pdf" | xargs rm

distclean: clean
	@rm -rf $(OUTPUT_DIR)
