<?php

/*
 * Script: report_sales_by_period.php
 * Sales reports by period add page
 * License:
 * GPL v3
 * Website:
 * http://www.simpleinvoices.org
 */
global $smarty;

checkLogin();
function firstOfMonth() {
    return date("Y-m-d", strtotime('01-' . date('m') . '-' . date('Y') . ' 00:00:00'));
}
function lastOfMonth() {
    return date("Y-m-d", strtotime('-1 second', strtotime('+1 month', strtotime('01-' . date('m') . '-' . date('Y') . ' 00:00:00'))));
}

$domain_id = domain_id::get();

isset($_POST['start_date']) ? $start_date = $_POST['start_date'] : $start_date = firstOfMonth();
isset($_POST['end_date']) ? $end_date = $_POST['end_date'] : $end_date = lastOfMonth();

// @formatter:off
$values = array("start_date" => $start_date,
                "end_date"   => $end_date,
                "having"     => "date_between",
                "having_and" => "real");
$invoice_all = Invoice::select_all($values);

$invoices = $invoice_all->fetchAll(PDO::FETCH_ASSOC);
$invoice_totals = array();
foreach($invoices as $k=>$v) {
    //get list of all products
    $sql = "SELECT DISTINCT(product_id) FROM ".TB_PREFIX."invoice_items WHERE invoice_id = :id AND domain_id = :domain_id";
    $sth = dbQuery($sql, ':id',$v['id'], ':domain_id', $domain_id);
        
    $products = $sth->fetchAll();
    $invoice_total_cost = "0";

    foreach($products as $pv) {
        $quantity="";
        $cost="";
        $product_total_cost="";

        $sqlp="SELECT SUM(quantity) FROM ".TB_PREFIX."invoice_items WHERE product_id = :product_id and invoice_id = :invoice_id AND domain_id = :domain_id";
        $sthp = dbQuery($sqlp, ':product_id',$pv['product_id'], ':invoice_id',$v['id'], ':domain_id', $domain_id);
        $quantity = $sthp->fetchColumn();

        #$sqlc="select (SELECT sum(cost) / sum(quantity)) as avg_cost  from si_inventory where product_id = :product_id";
        $sqlc="select (SELECT (SUM(cost * quantity) / SUM(quantity))) AS avg_cost FROM ".TB_PREFIX."inventory WHERE product_id = :product_id AND domain_id = :domain_id";
        $sthp = dbQuery($sqlc, ':product_id',$pv['product_id'], ':domain_id', $domain_id);
        $cost = $sthp->fetchColumn();

        $product_total_cost = $quantity * $cost;
        
        $invoice_total_cost += $product_total_cost;
    }
    $invoices[$k]['cost'  ] =  $invoice_total_cost;
    $invoices[$k]['profit'] =  $invoices[$k]['invoice_total'] - $invoices[$k]['cost'];

    $invoice_totals['sum_total' ] = $invoice_totals['sum_total' ] + $invoices[$k]['invoice_total'];
    $invoice_totals['sum_cost'  ] = $invoice_totals['sum_cost'  ] + $invoices[$k]['cost'         ];
    $invoice_totals['sum_profit'] = $invoice_totals['sum_profit'] + $invoices[$k]['profit'       ];
}

$smarty->assign('invoices'      , $invoices);
$smarty->assign('invoice_totals', $invoice_totals);
$smarty->assign('start_date'    , $start_date);
$smarty->assign('end_date'      , $end_date);

$smarty->assign('pageActive', 'report');
$smarty->assign('active_tab', '#home');
// @formatter:on
