class SchoolClassesController < ApplicationController

  def index
    @school_class = SchoolClass.all
  end

  def show
   @school_class = class_params
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def edit
    @school_class = class_params
  end

  def update
    @school_class = class_params
    @school_class.update(school_class_params)
    redirect_to school_class_path(@school_class)
  end

  private 
  def class_params
    SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:title, :room_number)
  end
end
