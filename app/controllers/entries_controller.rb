class EntriesController < ApplicationController
    def index
      @entries = Entry.all
    end
  
    def new
      @entry = Entry.new
    end
  
    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to root_url
      else
        render :new
      end
    end
  
    def destroy
      Entry.find(params[:id]).destroy
      redirect_to root_url
    end
  
    def your_symptoms
        @symptom_log = SymptomLog.new
        @symptom_logs = SymptomLog.all
    end
    
    def create_symptom_log
      @symptom_log = SymptomLog.new(symptom_log_params)
  
      # Combine day, month, and year into a single date
      if params[:symptom_log][:day].present? && params[:symptom_log][:month].present? && params[:symptom_log][:year].present?
        date_str = "#{params[:symptom_log][:year]}-#{params[:symptom_log][:month]}-#{params[:symptom_log][:day]}"
        @symptom_log.date = Date.parse(date_str) rescue nil
      end
  
      if @symptom_log.save
        redirect_to your_symptoms_path, notice: 'Symptom log was successfully created.'
      else
        @symptom_logs = SymptomLog.all
        render :your_symptoms
      end
    end
  
    def destroy_symptom_log
        @symptom_log = SymptomLog.find(params[:id])
        @symptom_log.destroy
        redirect_to your_symptoms_path, notice: 'Symptom log was successfully deleted.'
      end
  
    private
  
    def entry_params
      params.require(:entry).permit(:name, :link)
    end
  
    def symptom_log_params
      params.require(:symptom_log).permit(:symptom, :severity, :start_time, :end_time, :date)
    end
    
end  