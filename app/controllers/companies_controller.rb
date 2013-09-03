class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  require 'active_support/builder' unless defined?(Builder)
  respond_to :html, :json, :js

  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb --> You don't have to explicity specify it.. its just
      # that you need to specify
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    Rails.logger.info "\n*****\nParams Company: #{params[:company]} ********\n"

    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.js
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def company_division_stats
    @all_companies = @companies_data = Company.all # Option 1
    #Rails.logger.info "\n*******Companies:- #{@all_companies.inspect}*******\n"

    #@all_companies = Company.joins(:divisions).select('companies.name, count(divisions.id) as total').where('divisions.company_id = companies.id').order('count(divisions.id) DESC').group('companies.id')
    #http://stackoverflow.com/questions/17598898/preparing-data-to-plot-in-d3-js-from-ruby-on-rails-database

    @specific_details = @all_companies = @all_companies.map {|each_company| { country: each_company.name, visits: each_company.divisions_count} } # Option 2
    #@all_companies = @all_companies.to_s.gsub(":","")
    #@all_companies = @all_companies.gsub("=>",": ")

    respond_to do |format|
      unless @all_companies.nil?
        format.html
        format.json { render json: @specific_details, status: :created } #in the browser url would be:- localhost:3000/company_division_stats.json
        #format.json { render json: @all_companies.to_json, status: :created }
      end
    end
  end

  def company_division_stats2
    @all_companies = @companies_data = Company.all
    @specific_details = @all_companies = @all_companies.map {|each_company| { country: each_company.name, visits: each_company.divisions_count} } # Option 2
    respond_to do |format|
      unless @all_companies.nil?
        format.html
        format.json { render json: @specific_details, status: :created }
      end
    end
  end

  def company_division_stats3
    @all_companies = @companies_data = Company.all
    #@specific_details = @all_companies = @all_companies.map {|each_company| { country: each_company.name, visits: each_company.divisions_count} } # Option 2
    respond_to do |format|
      unless @all_companies.nil?
        format.html
        #format.json { render json: @specific_details, status: :created }
      end
    end
  end

  #print_all_companies(@the_companies) #basically you can pass an entire obj to another method..
  def print_all_companies(cos)
    Rails.logger.info "\n************\nAll companies:- #{cos}************\n"
    puts "All companies:- #{cos}"
  end



  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    Rails.logger.info "******\n\n\nCompany: #{params[:company]}***********\n\n\n"
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.js
      format.json { head :no_content }
    end
  end
end
