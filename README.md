# wk

Este é o projeto de Teste de software para a WK Sistemas, por Marcelo Fortes

- 100% Feito Em Delphi / Object Pascal e implementa TODAS as requisições do teste.
- Dados relacionais são tratados como dados relacionais através de SQL, ainda assim, criando uma classe TConsulta onde as consultas são disparadas por seus métodos
- Os métodos são chamados a partir dos arquivos que compõe a VIEW.
- A classe TConsulta está na camada Model.
- Para manter a simplicidade (KISS), não foram criadas classes de domínio que representam os pedidos, com sua respectivas interfaces sendo implementada numa classe concreta fazendo composição de interface, já que não é possível usar nenhum tipo de biblioteca de Mapeamento Objeto Relacional.
- O projeto possibilita a extensão dom classes de domínio.

![db](https://user-images.githubusercontent.com/58529630/136639109-0678c40b-ef95-47b1-8d9b-41b428b54537.png)
