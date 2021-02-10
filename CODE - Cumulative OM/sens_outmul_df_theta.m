%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'sens_outmul_df_theta';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('sens_outmul_df_theta.log');
M_.exo_names = 'epstV';
M_.exo_names_tex = 'epstV';
M_.exo_names_long = 'epstV';
M_.exo_names = char(M_.exo_names, 'epsgV');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsgV');
M_.exo_names_long = char(M_.exo_names_long, 'epsgV');
M_.endo_names = 'yV';
M_.endo_names_tex = 'yV';
M_.endo_names_long = 'output';
M_.endo_names = char(M_.endo_names, 'cV');
M_.endo_names_tex = char(M_.endo_names_tex, 'cV');
M_.endo_names_long = char(M_.endo_names_long, 'consumption');
M_.endo_names = char(M_.endo_names, 'gV');
M_.endo_names_tex = char(M_.endo_names_tex, 'gV');
M_.endo_names_long = char(M_.endo_names_long, 'government purchases');
M_.endo_names = char(M_.endo_names, 'xiV');
M_.endo_names_tex = char(M_.endo_names_tex, 'xiV');
M_.endo_names_long = char(M_.endo_names_long, 'xi');
M_.endo_names = char(M_.endo_names, 'RV');
M_.endo_names_tex = char(M_.endo_names_tex, 'RV');
M_.endo_names_long = char(M_.endo_names_long, 'nominal rate');
M_.endo_names = char(M_.endo_names, 'deltamV');
M_.endo_names_tex = char(M_.endo_names_tex, 'deltamV');
M_.endo_names_long = char(M_.endo_names_long, 'money growth');
M_.endo_names = char(M_.endo_names, 'bV');
M_.endo_names_tex = char(M_.endo_names_tex, 'bV');
M_.endo_names_long = char(M_.endo_names_long, 'debt');
M_.endo_names = char(M_.endo_names, 'tstarV');
M_.endo_names_tex = char(M_.endo_names_tex, 'tstarV');
M_.endo_names_long = char(M_.endo_names_long, 't-shock');
M_.endo_names = char(M_.endo_names, 'rhoV');
M_.endo_names_tex = char(M_.endo_names_tex, 'rhoV');
M_.endo_names_long = char(M_.endo_names_long, 'preference shock');
M_.endo_names = char(M_.endo_names, 'lV');
M_.endo_names_tex = char(M_.endo_names_tex, 'lV');
M_.endo_names_long = char(M_.endo_names_long, 'real money');
M_.endo_names = char(M_.endo_names, 'pieV');
M_.endo_names_tex = char(M_.endo_names_tex, 'pieV');
M_.endo_names_long = char(M_.endo_names_long, 'inflation(qar)');
M_.endo_names = char(M_.endo_names, 'pieyoyV');
M_.endo_names_tex = char(M_.endo_names_tex, 'pieyoyV');
M_.endo_names_long = char(M_.endo_names_long, 'inflation(yoy)');
M_.endo_names = char(M_.endo_names, 'muV');
M_.endo_names_tex = char(M_.endo_names_tex, 'muV');
M_.endo_names_long = char(M_.endo_names_long, 'mu');
M_.endo_names = char(M_.endo_names, 'tV');
M_.endo_names_tex = char(M_.endo_names_tex, 'tV');
M_.endo_names_long = char(M_.endo_names_long, 'taxes');
M_.endo_names = char(M_.endo_names, 'rrV');
M_.endo_names_tex = char(M_.endo_names_tex, 'rrV');
M_.endo_names_long = char(M_.endo_names_long, 'real rate');
M_.endo_names = char(M_.endo_names, 'byrV');
M_.endo_names_tex = char(M_.endo_names_tex, 'byrV');
M_.endo_names_long = char(M_.endo_names_long, 'debt-output ratio');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_10_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_10\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_10_1');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_10_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_10\_2');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_10_2');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names_long = 'beta';
M_.param_names = char(M_.param_names, 'varphi');
M_.param_names_tex = char(M_.param_names_tex, 'varphi');
M_.param_names_long = char(M_.param_names_long, 'varphi');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'Mp');
M_.param_names_tex = char(M_.param_names_tex, 'Mp');
M_.param_names_long = char(M_.param_names_long, 'Mp');
M_.param_names = char(M_.param_names, 'Mw');
M_.param_names_tex = char(M_.param_names_tex, 'Mw');
M_.param_names_long = char(M_.param_names_long, 'Mw');
M_.param_names = char(M_.param_names, 'varkappa');
M_.param_names_tex = char(M_.param_names_tex, 'varkappa');
M_.param_names_long = char(M_.param_names_long, 'varkappa');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'nu');
M_.param_names_tex = char(M_.param_names_tex, 'nu');
M_.param_names_long = char(M_.param_names_long, 'nu');
M_.param_names = char(M_.param_names, 'psib');
M_.param_names_tex = char(M_.param_names_tex, 'psib');
M_.param_names_long = char(M_.param_names_long, 'psib');
M_.param_names = char(M_.param_names, 'bss');
M_.param_names_tex = char(M_.param_names_tex, 'bss');
M_.param_names_long = char(M_.param_names_long, 'bss');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'epsilonp');
M_.param_names_tex = char(M_.param_names_tex, 'epsilonp');
M_.param_names_long = char(M_.param_names_long, 'epsilonp');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 18;
M_.param_nbr = 16;
M_.orig_endo_nbr = 16;
M_.aux_vars(1).endo_index = 17;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 11;
M_.aux_vars(1).orig_lead_lag = -1;
M_.aux_vars(2).endo_index = 18;
M_.aux_vars(2).type = 1;
M_.aux_vars(2).orig_index = 11;
M_.aux_vars(2).orig_lead_lag = -2;
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('sens_outmul_df_theta_static');
erase_compiled_function('sens_outmul_df_theta_dynamic');
M_.orig_eq_nbr = 16;
M_.eq_nbr = 18;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 9 0;
 0 10 0;
 1 11 0;
 0 12 27;
 2 13 0;
 0 14 0;
 3 15 0;
 4 16 0;
 0 17 0;
 5 18 0;
 6 19 28;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 7 25 0;
 8 26 0;]';
M_.nstatic = 9;
M_.nfwrd   = 1;
M_.npred   = 7;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 8;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(18, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(16, 1);
M_.NNZDerivatives = [57; 0; -1];
com_tax_df = zeros(200,1);
com_igp_df = zeros(200,1);
for i=0.01:0.01:0.99;
M_.params( 1 ) = 0.995;
beta = M_.params( 1 );
M_.params( 2 ) = 5;
varphi = M_.params( 2 );
M_.params( 3 ) = 0.25;
alpha = M_.params( 3 );
M_.params( 4 ) = i;
theta = M_.params( 4 );
M_.params( 5 ) = 1.125;
Mp = M_.params( 5 );
M_.params( 6 ) = 1.28;
Mw = M_.params( 6 );
M_.params( 7 ) = 0.3333333333333333;
varkappa = M_.params( 7 );
M_.params( 8 ) = 7;
eta = M_.params( 8 );
M_.params( 9 ) = 0;
nu = M_.params( 9 );
M_.params( 10 ) = 0.02;
psib = M_.params( 10 );
M_.params( 11 ) = 2.4;
bss = M_.params( 11 );
M_.params( 12 ) = 0.5;
delta = M_.params( 12 );
M_.params( 13 ) = 1;
sigma = M_.params( 13 );
M_.params( 15 ) = M_.params(5)/(M_.params(5)-1);
epsilonp = M_.params( 15 );
M_.params( 14 ) = (1-M_.params(4))*(1-M_.params(4)*M_.params(1))*(1-M_.params(3))/(M_.params(4)*(1-M_.params(3)+M_.params(3)*M_.params(15)));
lambda = M_.params( 14 );
M_.params( 16 ) = 0.005;
rho = M_.params( 16 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state(17)=oo_.steady_state(11);
oo_.steady_state(18)=oo_.steady_state(17);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',0) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',1:1,'value',1) ];
M_.exo_det_length = 0;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
index = int8(i*100);
com_igp_df(index) = (1-delta)*max(cumsum(yV));
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state(17)=oo_.steady_state(11);
oo_.steady_state(18)=oo_.steady_state(17);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',1) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',1:1,'value',0) ];
M_.exo_det_length = 0;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
index = int8(i*100);
com_tax_df(index) = (1-delta)*max(cumsum(yV));
end;
save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_tax_df_theta com_tax_df
save /Users/maximilianbrill/Desktop/Brill&Wolf/MATLAB/results/com_igp_df_theta com_igp_df
save('sens_outmul_df_theta_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('sens_outmul_df_theta_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
