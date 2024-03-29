# Modifications to libgmp to build on Android.
# Copyright (C) 2023 Free Software Foundation, Inc.

# These modifications are part of GNU Emacs.

# GNU Emacs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)

# Source files in the mpf directory.
libgmp_mpf_src := mpf/init.c mpf/init2.c mpf/inits.c mpf/set.c  \
  mpf/set_ui.c mpf/set_si.c mpf/set_str.c mpf/set_d.c		\
  mpf/set_z.c mpf/iset.c mpf/iset_ui.c mpf/iset_si.c		\
  mpf/iset_str.c mpf/iset_d.c mpf/clear.c mpf/clears.c		\
  mpf/get_str.c mpf/dump.c mpf/size.c mpf/eq.c mpf/reldiff.c	\
  mpf/sqrt.c mpf/random2.c mpf/inp_str.c mpf/out_str.c		\
  mpf/add.c mpf/add_ui.c mpf/sub.c mpf/sub_ui.c mpf/ui_sub.c	\
  mpf/mul.c mpf/mul_ui.c mpf/div.c mpf/div_ui.c mpf/cmp_z.c	\
  mpf/cmp.c mpf/cmp_d.c mpf/cmp_ui.c mpf/cmp_si.c		\
  mpf/mul_2exp.c mpf/div_2exp.c mpf/abs.c mpf/neg.c		\
  mpf/set_q.c mpf/get_d.c mpf/get_d_2exp.c mpf/set_dfl_prec.c   \
  mpf/set_prc.c mpf/set_prc_raw.c mpf/get_dfl_prec.c            \
  mpf/get_prc.c mpf/ui_div.c mpf/sqrt_ui.c                      \
  mpf/ceilfloor.c mpf/trunc.c mpf/pow_ui.c			\
  mpf/urandomb.c mpf/swap.c					\
  mpf/fits_sint.c mpf/fits_slong.c mpf/fits_sshort.c		\
  mpf/fits_uint.c mpf/fits_ulong.c mpf/fits_ushort.c		\
  mpf/get_si.c mpf/get_ui.c					\
  mpf/int_p.c

# Source files in the mpz directory.
libgmp_mpz_src := mpz/abs.c mpz/add.c mpz/add_ui.c		\
  mpz/aorsmul.c mpz/aorsmul_i.c mpz/and.c mpz/array_init.c	\
  mpz/bin_ui.c mpz/bin_uiui.c					\
  mpz/cdiv_q.c mpz/cdiv_q_ui.c					\
  mpz/cdiv_qr.c mpz/cdiv_qr_ui.c				\
  mpz/cdiv_r.c mpz/cdiv_r_ui.c mpz/cdiv_ui.c			\
  mpz/cfdiv_q_2exp.c mpz/cfdiv_r_2exp.c				\
  mpz/clear.c mpz/clears.c mpz/clrbit.c				\
  mpz/cmp.c mpz/cmp_d.c mpz/cmp_si.c mpz/cmp_ui.c		\
  mpz/cmpabs.c mpz/cmpabs_d.c mpz/cmpabs_ui.c			\
  mpz/com.c mpz/combit.c					\
  mpz/cong.c mpz/cong_2exp.c mpz/cong_ui.c			\
  mpz/divexact.c mpz/divegcd.c mpz/dive_ui.c			\
  mpz/divis.c mpz/divis_ui.c mpz/divis_2exp.c mpz/dump.c	\
  mpz/export.c mpz/mfac_uiui.c					\
  mpz/2fac_ui.c mpz/fac_ui.c mpz/oddfac_1.c mpz/prodlimbs.c	\
  mpz/fdiv_q_ui.c mpz/fdiv_qr.c mpz/fdiv_qr_ui.c		\
  mpz/fdiv_r.c mpz/fdiv_r_ui.c mpz/fdiv_q.c			\
  mpz/fdiv_ui.c mpz/fib_ui.c mpz/fib2_ui.c mpz/fits_sint.c	\
  mpz/fits_slong.c mpz/fits_sshort.c mpz/fits_uint.c		\
  mpz/fits_ulong.c mpz/fits_ushort.c mpz/gcd.c			\
  mpz/gcd_ui.c mpz/gcdext.c mpz/get_d.c mpz/get_d_2exp.c	\
  mpz/get_si.c mpz/get_str.c mpz/get_ui.c mpz/getlimbn.c	\
  mpz/hamdist.c							\
  mpz/import.c mpz/init.c mpz/init2.c mpz/inits.c		\
  mpz/inp_raw.c mpz/inp_str.c mpz/invert.c			\
  mpz/ior.c mpz/iset.c mpz/iset_d.c mpz/iset_si.c		\
  mpz/iset_str.c mpz/iset_ui.c mpz/jacobi.c mpz/kronsz.c	\
  mpz/kronuz.c mpz/kronzs.c mpz/kronzu.c			\
  mpz/lcm.c mpz/lcm_ui.c mpz/limbs_finish.c			\
  mpz/limbs_modify.c mpz/limbs_read.c mpz/limbs_write.c		\
  mpz/lucmod.c mpz/lucnum_ui.c mpz/lucnum2_ui.c			\
  mpz/millerrabin.c mpz/mod.c mpz/mul.c mpz/mul_2exp.c		\
  mpz/mul_si.c mpz/mul_ui.c					\
  mpz/n_pow_ui.c mpz/neg.c mpz/nextprime.c			\
  mpz/out_raw.c mpz/out_str.c mpz/perfpow.c mpz/perfsqr.c	\
  mpz/popcount.c mpz/pow_ui.c mpz/powm.c mpz/powm_sec.c		\
  mpz/powm_ui.c mpz/primorial_ui.c				\
  mpz/pprime_p.c mpz/random.c mpz/random2.c			\
  mpz/realloc.c mpz/realloc2.c mpz/remove.c mpz/roinit_n.c	\
  mpz/root.c mpz/rootrem.c mpz/rrandomb.c mpz/scan0.c		\
  mpz/scan1.c mpz/set.c mpz/set_d.c mpz/set_f.c			\
  mpz/set_q.c mpz/set_si.c mpz/set_str.c mpz/set_ui.c		\
  mpz/setbit.c							\
  mpz/size.c mpz/sizeinbase.c mpz/sqrt.c			\
  mpz/sqrtrem.c mpz/stronglucas.c mpz/sub.c			\
  mpz/sub_ui.c mpz/swap.c					\
  mpz/tdiv_ui.c mpz/tdiv_q.c mpz/tdiv_q_2exp.c			\
  mpz/tdiv_q_ui.c mpz/tdiv_qr.c mpz/tdiv_qr_ui.c		\
  mpz/tdiv_r.c mpz/tdiv_r_2exp.c mpz/tdiv_r_ui.c		\
  mpz/tstbit.c mpz/ui_pow_ui.c mpz/ui_sub.c mpz/urandomb.c	\
  mpz/urandomm.c mpz/xor.c

# Source files in the MPQ directory.
libgmp_mpq_src := mpq/abs.c mpq/aors.c			\
  mpq/canonicalize.c mpq/clear.c mpq/clears.c		\
  mpq/cmp.c mpq/cmp_si.c mpq/cmp_ui.c mpq/div.c		\
  mpq/get_d.c mpq/get_den.c mpq/get_num.c mpq/get_str.c	\
  mpq/init.c mpq/inits.c mpq/inp_str.c mpq/inv.c	\
  mpq/md_2exp.c mpq/mul.c mpq/neg.c mpq/out_str.c	\
  mpq/set.c mpq/set_den.c mpq/set_num.c			\
  mpq/set_si.c mpq/set_str.c mpq/set_ui.c		\
  mpq/equal.c mpq/set_z.c mpq/set_d.c			\
  mpq/set_f.c mpq/swap.c

# Source files in the mpn directory.
libgmp_mpn_src :=

# Source files in the printf directory.
libgmp_printf_src := printf/asprintf.c printf/asprntffuns.c	\
  printf/doprnt.c printf/doprntf.c printf/doprnti.c		\
  printf/fprintf.c						\
  printf/obprintf.c printf/obvprintf.c printf/obprntffuns.c	\
  printf/printf.c printf/printffuns.c				\
  printf/snprintf.c printf/snprntffuns.c			\
  printf/sprintf.c printf/sprintffuns.c				\
  printf/vasprintf.c printf/vfprintf.c printf/vprintf.c		\
  printf/vsnprintf.c printf/vsprintf.c				\
  printf/repl-vsnprintf.c

# Source files in the scanf directory.
libgmp_scanf_src := scanf/doscan.c scanf/fscanf.c scanf/fscanffuns.c	\
  scanf/scanf.c scanf/sscanf.c scanf/sscanffuns.c			\
  scanf/vfscanf.c scanf/vscanf.c scanf/vsscanf.c

# Source files in the random directory.
libgmp_random_src := rand/rand.c rand/randclr.c rand/randdef.c	\
  rand/randiset.c rand/randlc2s.c rand/randlc2x.c rand/randmt.c	\
  rand/randmts.c rand/rands.c rand/randsd.c rand/randsdui.c	\
  rand/randbui.c rand/randmui.c

# Sources for libgmp.a and libgmp.o.
libgmp_src := assert.c compat.c errno.c extract-dbl.c invalid.c memory.c	\
  mp_bpl.c mp_clz_tab.c mp_dv_tab.c mp_minv_tab.c mp_get_fns.c			\
  mp_set_fns.c version.c nextprime.c primesieve.c tal-reent.c

# armv7 MPN srclinks.
libgmp_mpn_src_armv7 := mpn/add.c mpn/add_1.c mpn/add_n.asm mpn/sub.c		\
  mpn/sub_1.c mpn/sub_n.asm mpn/cnd_add_n.asm mpn/cnd_sub_n.asm			\
  mpn/cnd_swap.c mpn/neg.c mpn/com.asm mpn/mul_1.asm mpn/addmul_1.asm		\
  mpn/submul_1.asm mpn/add_err1_n.c mpn/add_err2_n.c mpn/add_err3_n.c		\
  mpn/sub_err1_n.c mpn/sub_err2_n.c mpn/sub_err3_n.c mpn/lshift.asm		\
  mpn/rshift.asm mpn/dive_1.asm mpn/diveby3.c mpn/divis.c mpn/divrem.c		\
  mpn/divrem_1.asm mpn/divrem_2.c mpn/fib2_ui.c mpn/fib2m.c mpn/mod_1.c		\
  mpn/mod_34lsub1.asm mpn/mode1o.asm mpn/pre_mod_1.c mpn/dump.c			\
  mpn/mod_1_1.asm mpn/mod_1_2.asm mpn/mod_1_3.c mpn/mod_1_4.c			\
  mpn/lshiftc.asm mpn/mul.c mpn/mul_fft.c mpn/mul_n.c mpn/sqr.c			\
  mpn/mul_basecase.c mpn/sqr_basecase.asm mpn/nussbaumer_mul.c			\
  mpn/mulmid_basecase.c mpn/toom42_mulmid.c mpn/mulmid_n.c			\
  mpn/mulmid.c mpn/random.c mpn/random2.c mpn/pow_1.c mpn/rootrem.c		\
  mpn/sqrtrem.c mpn/sizeinbase.c mpn/get_str.c mpn/set_str.c			\
  mpn/compute_powtab.c mpn/scan0.c mpn/scan1.c mpn/popcount.asm			\
  mpn/hamdist.asm mpn/cmp.c mpn/zero_p.c mpn/perfsqr.c mpn/perfpow.c		\
  mpn/strongfibo.c mpn/gcd_11.asm mpn/gcd_22.asm mpn/gcd_1.c mpn/gcd.c		\
  mpn/gcdext_1.c mpn/gcdext.c mpn/gcd_subdiv_step.c mpn/gcdext_lehmer.c		\
  mpn/div_q.c mpn/tdiv_qr.c mpn/jacbase.c mpn/jacobi_2.c mpn/jacobi.c		\
  mpn/get_d.c mpn/matrix22_mul.c mpn/matrix22_mul1_inverse_vector.c		\
  mpn/hgcd_matrix.c mpn/hgcd2.c mpn/hgcd_step.c mpn/hgcd_reduce.c mpn/hgcd.c	\
  mpn/hgcd_appr.c mpn/hgcd2_jacobi.c mpn/hgcd_jacobi.c mpn/mullo_n.c		\
  mpn/mullo_basecase.c mpn/sqrlo.c mpn/sqrlo_basecase.c mpn/toom22_mul.c	\
  mpn/toom32_mul.c mpn/toom42_mul.c mpn/toom52_mul.c mpn/toom62_mul.c		\
  mpn/toom33_mul.c mpn/toom43_mul.c mpn/toom53_mul.c mpn/toom54_mul.c		\
  mpn/toom63_mul.c mpn/toom44_mul.c mpn/toom6h_mul.c mpn/toom6_sqr.c		\
  mpn/toom8h_mul.c mpn/toom8_sqr.c mpn/toom_couple_handling.c mpn/toom2_sqr.c	\
  mpn/toom3_sqr.c mpn/toom4_sqr.c mpn/toom_eval_dgr3_pm1.c			\
  mpn/toom_eval_dgr3_pm2.c mpn/toom_eval_pm1.c mpn/toom_eval_pm2.c		\
  mpn/toom_eval_pm2exp.c mpn/toom_eval_pm2rexp.c mpn/toom_interpolate_5pts.c	\
  mpn/toom_interpolate_6pts.c mpn/toom_interpolate_7pts.c			\
  mpn/toom_interpolate_8pts.c mpn/toom_interpolate_12pts.c			\
  mpn/toom_interpolate_16pts.c mpn/invertappr.c mpn/invert.c mpn/binvert.c	\
  mpn/mulmod_bnm1.c mpn/sqrmod_bnm1.c mpn/div_qr_1.c mpn/div_qr_1n_pi1.c	\
  mpn/div_qr_2.c mpn/div_qr_2n_pi1.c mpn/div_qr_2u_pi1.c mpn/sbpi1_div_q.c	\
  mpn/sbpi1_div_qr.c mpn/sbpi1_divappr_q.c mpn/dcpi1_div_q.c			\
  mpn/dcpi1_div_qr.c mpn/dcpi1_divappr_q.c mpn/mu_div_qr.c			\
  mpn/mu_divappr_q.c mpn/mu_div_q.c mpn/bdiv_q_1.asm mpn/sbpi1_bdiv_q.c		\
  mpn/sbpi1_bdiv_qr.c mpn/sbpi1_bdiv_r.c mpn/dcpi1_bdiv_q.c			\
  mpn/dcpi1_bdiv_qr.c mpn/mu_bdiv_q.c mpn/mu_bdiv_qr.c mpn/bdiv_q.c		\
  mpn/bdiv_qr.c mpn/broot.c mpn/brootinv.c mpn/bsqrt.c mpn/bsqrtinv.c		\
  mpn/divexact.c mpn/bdiv_dbm1c.asm mpn/redc_1.c mpn/redc_2.c mpn/redc_n.c	\
  mpn/powm.c mpn/powlo.c mpn/sec_powm.c mpn/sec_mul.c mpn/sec_sqr.c		\
  mpn/sec_div_qr.c mpn/sec_div_r.c mpn/sec_pi1_div_qr.c mpn/sec_pi1_div_r.c	\
  mpn/sec_add_1.c mpn/sec_sub_1.c mpn/sec_invert.c mpn/trialdiv.c mpn/remove.c	\
  mpn/and_n.asm mpn/andn_n.asm mpn/nand_n.asm mpn/ior_n.asm mpn/iorn_n.asm	\
  mpn/nior_n.asm mpn/xor_n.asm mpn/xnor_n.asm mpn/copyi.asm mpn/copyd.asm	\
  mpn/zero.c mpn/sec_tabselect.asm mpn/comb_tables.c mpn/udiv.asm		\
  mpn/invert_limb.asm mpn/mul_2.asm mpn/addmul_2.asm mpn/addmul_3.asm		\
  mpn/addlsh1_n.asm mpn/sublsh1_n.asm mpn/rsh1add_n.asm mpn/rsh1sub_n.asm	\
  mpn/add_n_sub_n.c

# Rewrite these locations to start from the `armv7' directory
# instead.
libgmp_mpn_src_armv7 := $(foreach file,$(libgmp_mpn_src_armv7), \
     android-armv7/$(notdir $(file)))

# Add the pregenerated fib table.
libgmp_mpn_src_armv7 := $(libgmp_mpn_src_armv7) android-armv7/fib_table.c \
  android-armv7/mp_bases.c

libgmp_mpn_src_aarch64 := mpn/add.c mpn/add_1.c mpn/add_n.asm mpn/sub.c		\
  mpn/sub_1.c mpn/sub_n.asm mpn/cnd_add_n.asm mpn/cnd_sub_n.asm			\
  mpn/cnd_swap.c mpn/neg.c mpn/com.asm mpn/mul_1.asm mpn/addmul_1.asm		\
  mpn/submul_1.asm mpn/add_err1_n.c mpn/add_err2_n.c mpn/add_err3_n.c		\
  mpn/sub_err1_n.c mpn/sub_err2_n.c mpn/sub_err3_n.c mpn/lshift.asm		\
  mpn/rshift.asm mpn/dive_1.c mpn/diveby3.c mpn/divis.c mpn/divrem.c		\
  mpn/divrem_1.c mpn/divrem_2.c mpn/fib2_ui.c mpn/fib2m.c mpn/mod_1.c		\
  mpn/mod_34lsub1.asm mpn/mode1o.c mpn/pre_divrem_1.c mpn/pre_mod_1.c		\
  mpn/dump.c mpn/mod_1_1.c mpn/mod_1_2.c mpn/mod_1_3.c mpn/mod_1_4.c		\
  mpn/lshiftc.asm mpn/mul.c mpn/mul_fft.c mpn/mul_n.c mpn/sqr.c			\
  mpn/mul_basecase.c mpn/sqr_basecase.c mpn/nussbaumer_mul.c			\
  mpn/mulmid_basecase.c mpn/toom42_mulmid.c mpn/mulmid_n.c mpn/mulmid.c		\
  mpn/random.c mpn/random2.c mpn/pow_1.c mpn/rootrem.c mpn/sqrtrem.c		\
  mpn/sizeinbase.c mpn/get_str.c mpn/set_str.c mpn/compute_powtab.c		\
  mpn/scan0.c mpn/scan1.c mpn/popcount.asm mpn/hamdist.asm mpn/cmp.c		\
  mpn/zero_p.c mpn/perfsqr.c mpn/perfpow.c mpn/strongfibo.c			\
  mpn/gcd_11.asm mpn/gcd_22.asm mpn/gcd_1.c mpn/gcd.c mpn/gcdext_1.c		\
  mpn/gcdext.c mpn/gcd_subdiv_step.c mpn/gcdext_lehmer.c mpn/div_q.c		\
  mpn/tdiv_qr.c mpn/jacbase.c mpn/jacobi_2.c mpn/jacobi.c mpn/get_d.c		\
  mpn/matrix22_mul.c mpn/matrix22_mul1_inverse_vector.c mpn/hgcd_matrix.c	\
  mpn/hgcd2.c mpn/hgcd_step.c mpn/hgcd_reduce.c mpn/hgcd.c			\
  mpn/hgcd_appr.c mpn/hgcd2_jacobi.c mpn/hgcd_jacobi.c mpn/mullo_n.c		\
  mpn/mullo_basecase.c mpn/sqrlo.c mpn/sqrlo_basecase.c mpn/toom22_mul.c	\
  mpn/toom32_mul.c mpn/toom42_mul.c mpn/toom52_mul.c mpn/toom62_mul.c		\
  mpn/toom33_mul.c mpn/toom43_mul.c mpn/toom53_mul.c mpn/toom54_mul.c		\
  mpn/toom63_mul.c mpn/toom44_mul.c mpn/toom6h_mul.c mpn/toom6_sqr.c		\
  mpn/toom8h_mul.c mpn/toom8_sqr.c mpn/toom_couple_handling.c			\
  mpn/toom2_sqr.c mpn/toom3_sqr.c mpn/toom4_sqr.c				\
  mpn/toom_eval_dgr3_pm1.c mpn/toom_eval_dgr3_pm2.c mpn/toom_eval_pm1.c		\
  mpn/toom_eval_pm2.c mpn/toom_eval_pm2exp.c mpn/toom_eval_pm2rexp.c		\
  mpn/toom_interpolate_5pts.c mpn/toom_interpolate_6pts.c			\
  mpn/toom_interpolate_7pts.c mpn/toom_interpolate_8pts.c			\
  mpn/toom_interpolate_12pts.c mpn/toom_interpolate_16pts.c			\
  mpn/invertappr.c mpn/invert.c mpn/binvert.c mpn/mulmod_bnm1.c			\
  mpn/sqrmod_bnm1.c mpn/div_qr_1.c mpn/div_qr_1n_pi1.c mpn/div_qr_2.c		\
  mpn/div_qr_2n_pi1.c mpn/div_qr_2u_pi1.c mpn/sbpi1_div_q.c			\
  mpn/sbpi1_div_qr.c mpn/sbpi1_divappr_q.c mpn/dcpi1_div_q.c			\
  mpn/dcpi1_div_qr.c mpn/dcpi1_divappr_q.c mpn/mu_div_qr.c			\
  mpn/mu_divappr_q.c mpn/mu_div_q.c mpn/bdiv_q_1.asm mpn/sbpi1_bdiv_q.c		\
  mpn/sbpi1_bdiv_qr.c mpn/sbpi1_bdiv_r.c mpn/dcpi1_bdiv_q.c			\
  mpn/dcpi1_bdiv_qr.c mpn/mu_bdiv_q.c mpn/mu_bdiv_qr.c mpn/bdiv_q.c		\
  mpn/bdiv_qr.c mpn/broot.c mpn/brootinv.c mpn/bsqrt.c mpn/bsqrtinv.c		\
  mpn/divexact.c mpn/bdiv_dbm1c.asm mpn/redc_1.c mpn/redc_2.c			\
  mpn/redc_n.c mpn/powm.c mpn/powlo.c mpn/sec_powm.c mpn/sec_mul.c		\
  mpn/sec_sqr.c mpn/sec_div_qr.c mpn/sec_div_r.c mpn/sec_pi1_div_qr.c		\
  mpn/sec_pi1_div_r.c mpn/sec_add_1.c mpn/sec_sub_1.c mpn/sec_invert.c		\
  mpn/trialdiv.c mpn/remove.c mpn/and_n.asm mpn/andn_n.asm mpn/nand_n.asm	\
  mpn/ior_n.asm mpn/iorn_n.asm mpn/nior_n.asm mpn/xor_n.asm mpn/xnor_n.asm	\
  mpn/copyi.asm mpn/copyd.asm mpn/zero.c mpn/sec_tabselect.asm			\
  mpn/comb_tables.c mpn/invert_limb.asm mpn/sqr_diag_addlsh1.asm		\
  mpn/addlsh1_n.asm mpn/sublsh1_n.asm mpn/rsblsh1_n.asm				\
  mpn/rsh1add_n.asm mpn/rsh1sub_n.asm mpn/addlsh2_n.asm				\
  mpn/sublsh2_n.asm mpn/rsblsh2_n.asm mpn/add_n_sub_n.c

# Rewrite these locations to start from the `aarch64' directory
# instead.

libgmp_mpn_src_aarch64 := $(foreach file,$(libgmp_mpn_src_aarch64), \
			      android-aarch64/$(notdir $(file)))

# Add the pregenerated fib table.
libgmp_mpn_src_aarch64 := $(libgmp_mpn_src_aarch64) \
  android-aarch64/fib_table.c android-aarch64/mp_bases.c

# x86_64 MPN srclinks.
libgmp_mpn_src_x86_64 := mpn/invert_limb_table.asm mpn/add.c mpn/add_1.c	\
  mpn/add_n.asm mpn/sub.c mpn/sub_1.c mpn/sub_n.asm				\
  mpn/cnd_add_n.asm mpn/cnd_sub_n.asm mpn/cnd_swap.c mpn/neg.c			\
  mpn/com.asm mpn/mul_1.asm mpn/addmul_1.asm mpn/submul_1.asm			\
  mpn/add_err1_n.asm mpn/add_err2_n.asm mpn/add_err3_n.asm mpn/sub_err1_n.asm	\
  mpn/sub_err2_n.asm mpn/sub_err3_n.asm mpn/lshift.asm mpn/rshift.asm		\
  mpn/dive_1.asm mpn/diveby3.c mpn/divis.c mpn/divrem.c mpn/divrem_1.asm	\
  mpn/divrem_2.asm mpn/fib2_ui.c mpn/fib2m.c mpn/mod_1.c mpn/mod_34lsub1.asm	\
  mpn/mode1o.asm mpn/pre_mod_1.c mpn/dump.c mpn/mod_1_1.asm mpn/mod_1_2.asm	\
  mpn/mod_1_3.c mpn/mod_1_4.asm mpn/lshiftc.asm mpn/mul.c mpn/mul_fft.c		\
  mpn/mul_n.c mpn/sqr.c mpn/mul_basecase.asm mpn/sqr_basecase.asm		\
  mpn/nussbaumer_mul.c mpn/mulmid_basecase.asm mpn/toom42_mulmid.c		\
  mpn/mulmid_n.c mpn/mulmid.c mpn/random.c mpn/random2.c mpn/pow_1.c		\
  mpn/rootrem.c mpn/sqrtrem.c mpn/sizeinbase.c mpn/get_str.c mpn/set_str.c	\
  mpn/compute_powtab.c mpn/scan0.c mpn/scan1.c mpn/popcount.asm mpn/hamdist.asm	\
  mpn/cmp.c mpn/zero_p.c mpn/perfsqr.c mpn/perfpow.c mpn/strongfibo.c		\
  mpn/gcd_11.asm mpn/gcd_22.asm mpn/gcd_1.c mpn/gcd.c mpn/gcdext_1.c		\
  mpn/gcdext.c mpn/gcd_subdiv_step.c mpn/gcdext_lehmer.c mpn/div_q.c		\
  mpn/tdiv_qr.c mpn/jacbase.c mpn/jacobi_2.c mpn/jacobi.c mpn/get_d.c		\
  mpn/matrix22_mul.c mpn/matrix22_mul1_inverse_vector.c mpn/hgcd_matrix.c	\
  mpn/hgcd2.c mpn/hgcd_step.c mpn/hgcd_reduce.c mpn/hgcd.c mpn/hgcd_appr.c	\
  mpn/hgcd2_jacobi.c mpn/hgcd_jacobi.c mpn/mullo_n.c mpn/mullo_basecase.asm	\
  mpn/sqrlo.c mpn/sqrlo_basecase.c mpn/toom22_mul.c mpn/toom32_mul.c		\
  mpn/toom42_mul.c mpn/toom52_mul.c mpn/toom62_mul.c mpn/toom33_mul.c		\
  mpn/toom43_mul.c mpn/toom53_mul.c mpn/toom54_mul.c mpn/toom63_mul.c		\
  mpn/toom44_mul.c mpn/toom6h_mul.c mpn/toom6_sqr.c mpn/toom8h_mul.c		\
  mpn/toom8_sqr.c mpn/toom_couple_handling.c mpn/toom2_sqr.c mpn/toom3_sqr.c	\
  mpn/toom4_sqr.c mpn/toom_eval_dgr3_pm1.c mpn/toom_eval_dgr3_pm2.c		\
  mpn/toom_eval_pm1.c mpn/toom_eval_pm2.c mpn/toom_eval_pm2exp.c		\
  mpn/toom_eval_pm2rexp.c mpn/toom_interpolate_5pts.c				\
  mpn/toom_interpolate_6pts.c mpn/toom_interpolate_7pts.c			\
  mpn/toom_interpolate_8pts.c mpn/toom_interpolate_12pts.c			\
  mpn/toom_interpolate_16pts.c mpn/invertappr.c mpn/invert.c mpn/binvert.c	\
  mpn/mulmod_bnm1.c mpn/sqrmod_bnm1.c mpn/div_qr_1.c mpn/div_qr_1n_pi1.asm	\
  mpn/div_qr_2.c mpn/div_qr_2n_pi1.asm mpn/div_qr_2u_pi1.asm mpn/sbpi1_div_q.c	\
  mpn/sbpi1_div_qr.c mpn/sbpi1_divappr_q.c mpn/dcpi1_div_q.c mpn/dcpi1_div_qr.c	\
  mpn/dcpi1_divappr_q.c mpn/mu_div_qr.c mpn/mu_divappr_q.c mpn/mu_div_q.c	\
  mpn/bdiv_q_1.asm mpn/sbpi1_bdiv_q.c mpn/sbpi1_bdiv_qr.c mpn/sbpi1_bdiv_r.c	\
  mpn/dcpi1_bdiv_q.c mpn/dcpi1_bdiv_qr.c mpn/mu_bdiv_q.c mpn/mu_bdiv_qr.c	\
  mpn/bdiv_q.c mpn/bdiv_qr.c mpn/broot.c mpn/brootinv.c mpn/bsqrt.c		\
  mpn/bsqrtinv.c mpn/divexact.c mpn/bdiv_dbm1c.asm mpn/redc_1.asm		\
  mpn/redc_2.c mpn/redc_n.c mpn/powm.c mpn/powlo.c mpn/sec_powm.c mpn/sec_mul.c	\
  mpn/sec_sqr.c mpn/sec_div_qr.c mpn/sec_div_r.c mpn/sec_pi1_div_qr.c		\
  mpn/sec_pi1_div_r.c mpn/sec_add_1.c mpn/sec_sub_1.c mpn/sec_invert.c		\
  mpn/trialdiv.c mpn/remove.c mpn/and_n.asm mpn/andn_n.asm mpn/nand_n.asm	\
  mpn/ior_n.asm mpn/iorn_n.asm mpn/nior_n.asm mpn/xor_n.asm mpn/xnor_n.asm	\
  mpn/copyi.asm mpn/copyd.asm mpn/zero.c mpn/sec_tabselect.asm			\
  mpn/comb_tables.c mpn/invert_limb.asm mpn/sqr_diag_addlsh1.asm mpn/mul_2.asm	\
  mpn/addmul_2.asm mpn/addlsh1_n.asm mpn/sublsh1_n.asm mpn/rsblsh1_n.asm	\
  mpn/rsh1add_n.asm mpn/rsh1sub_n.asm mpn/addlsh2_n.asm mpn/rsblsh2_n.asm	\
  mpn/addlsh_n.asm mpn/rsblsh_n.asm mpn/add_n_sub_n.c mpn/addaddmul_1msb0.asm

# Rewrite these locations to start from the `android-x86_64' directory
# instead.
libgmp_mpn_src_x86_64 := $(foreach file,$(libgmp_mpn_src_x86_64), \
     android-x86_64/$(notdir $(file)))

# Add the pregenerated fib table.
libgmp_mpn_src_x86_64 := $(libgmp_mpn_src_x86_64) android-x86_64/fib_table.c \
  android-x86_64/mp_bases.c

include $(CLEAR_VARS)

# Make sure instructions are generated in ARM mode.  Thumb mode does
# not work very well.

LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := $(libgmp_mpf_src) $(libgmp_mpz_src)		\
  $(libgmp_mpq_src) $(libgmp_mpn_src) $(libgmp_printf_src)	\
  $(libgmp_scanf_src) $(libgmp_random_src) $(libgmp_src)
LOCAL_SRC_FILES_arm := $(libgmp_mpn_src_armv7)
LOCAL_SRC_FILES_arm64 := $(libgmp_mpn_src_aarch64)
LOCAL_SRC_FILES_x86_64 := $(libgmp_mpn_src_x86_64)

ifeq ($(NDK_BUILD_ARCH),arm64)
libgmp_arch_root_dir := $(LOCAL_PATH)/android-aarch64
else
ifeq ($(NDK_BUILD_ARCH),x86_64)
libgmp_arch_root_dir := $(LOCAL_PATH)/android-x86_64
else
libgmp_arch_root_dir := $(LOCAL_PATH)/android-armv7
endif
endif

define libgmp_m4_args
-DPIC -DOPERATION_$(basename $(notdir $(1))) -I$(LOCAL_PATH)/mpn/ \
-I$(libgmp_arch_root_dir) -I$(libgmp_arch_root_dir)/dummy
endef

# Emacs extension: this is a function called for files ending with
# ``.asm'' to define rules to build them as objects.
define LOCAL_ASM_RULE

$(1): $(2)
	cp $(2) $(1).asm-tmp
	cd $(libgmp_arch_root_dir)		\
	  && m4 $$(call libgmp_m4_args,$$<)	\
		$$(abspath $(1).asm-tmp)	\
	     > $$(abspath $(1).s)
	$(NDK_BUILD_CC) -fPIC -c $(1).s -o $$@
	rm -f $(1).s $(1).asm-tmp

endef

# Emacs extension: this is a function called for each C file to get
# its cflags.
define LOCAL_C_ADDITIONAL_FLAGS
$(and $(findstring android-,$(1)),-DOPERATION_$(basename $(notdir $(1))))
endef

LOCAL_ASM_RULE_DEFINED := 1

LOCAL_CFLAGS := -O2 -pedantic -DPIC
LOCAL_CFLAGS_arm := -fomit-frame-pointer -march=armv7-a -mtune=cortex-a5
LOCAL_CFLAGS_arm64 := -O2 -pedantic -march=armv8-a
LOCAL_CFLAGS_x86_64 := -O2 -pedantic -fomit-frame-pointer -m64 -mtune=k8 \
  -march=k8

# Allow finding the right config.h and gmp-mparam.h.
LOCAL_CFLAGS_arm := -I$(LOCAL_PATH)/android-armv7
LOCAL_CFLAGS_arm64 := -I$(LOCAL_PATH)/android-aarch64
LOCAL_CFLAGS_x86_64 := -I$(LOCAL_PATH)/android-x86_64

# Export this directory.
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libgmp_arch_root_dir)

# Build as a shared library.
LOCAL_MODULE := libgmp

include $(BUILD_SHARED_LIBRARY)
