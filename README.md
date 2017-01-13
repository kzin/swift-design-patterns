# Design Patters

Este projeto conta com a implementação de alguns padrões de projetos em swift. Os conceitos abaixo foram retirados do livro "Use a Cabeça: Padrões de Projetos"

-------
<p align="center">
<a href="#strategy">Strategy</a> &bull;
<a href="#observer">Observer</a> &bull;
<a href="#decorator">Decorator</a> &bull;
<a href="#factory">Factory</a> &bull;
<a href="#singleton">Singleton</a> &bull;
<a href="#command">Command</a> &bull;
<a href="#adapter">Adapter</a> &bull;
<a href="#facade">Facade</a> &bull;
<a href="#templatemethod">Template Method</a> &bull;
<a href="#state">State</a>
</p>
-------

## Strategy

Define uma família de algoritmos, encapsula cada um deles e os torna intercambiáveis. A strategy permite que o algoritmo varie independentemente dos clients que o utilizam

## Observer

Define uma dependência um-para-muitos entre objetos de modo que quando um objeto muda de estado, todos os seus dependentes são notificados e atualizados automaticamente

## Decorator

Anexa responsabilidades adicionais a um objeto de maneira dinâmica. Os decorators fornecem uma alternativa flexível para a subclasse para estender a funcionalidade

## Factory

Abstract Factory: Forneçe uma interface para criar famílias de objetos relacionados ou dependentes sem especificar suas classes concretas

Factory Method: Define uma interface para criar um objeto, mas deixa as subclasses decidirem em qual classe criar a instância. O Factory Method permite que uma classe defira a criação de instâncias para as subclasses

## Singleton

Verifica se uma classe tem apenas uma instância e forneçe um ponto global de acesso a ela

## Command

Encapsula uma solicitação como um objeto, permitindo que você parametrize clientes com diferentes solicitações enfileire ou registre solicitações e implemente operações reversíveis

## Adapter

Converte a interface de uma classe para outra interface que o cliente espera encontrar. O Adapter permite que classes com interfaces incompatíveis trabalhem juntas

## Facade

Fornece uma interface unificada para um conjunto de interfaces em um subsistema. A Facade define uma interface de nível alto que facilita a utilização do subsistema

## Template Method

Define o esqueleto de um algoritmo dentro de um método, transferindo alguns de seus passos para as subclasses. O Template Method permite que as subclasses redefinam certos passos de um algoritmo sem alterar a estrutura do próprio algoritmo

## State

Permite que um objeto altere seu comportamento quando seu estado interno muda. O objeto parecerá ter mudado sua classe
