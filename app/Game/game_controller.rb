require 'rho/rhocontroller'
require 'helpers/browser_helper'

class GameController < Rho::RhoController
  include BrowserHelper

  # GET /Game
  def index
    @games = Game.find(:all)
    render :back => '/app'
  end

  # GET /Game/{1}
  def show
    @game = Game.find(@params['id'])
    if @game
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Game/new
  def new
    @game = Game.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Game/{1}/edit
  def edit
    @game = Game.find(@params['id'])
    if @game
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Game/create
  def create
    @game = Game.create(@params['game'])
    redirect :action => :index
  end

  # POST /Game/{1}/update
  def update
    @game = Game.find(@params['id'])
    @game.update_attributes(@params['game']) if @game
    redirect :action => :index
  end

  # POST /Game/{1}/delete
  def delete
    @game = Game.find(@params['id'])
    @game.destroy if @game
    redirect :action => :index  
  end
end
