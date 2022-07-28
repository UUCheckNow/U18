//
//  UURankListViewController.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import UIKit

class UURankListViewController: UUBaseViewController {

    private var rankList = [RankingModel]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.background
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UURankTabCell.self, forCellReuseIdentifier: "UURankTabCell")
        tableView.uHead = UURefreshHeader{ [weak self] in self?.loadData() }
        tableView.uempty = UUEmptyView{ [weak self] in self?.loadData() }
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    @objc private func loadData() {
        ApiLoadingProvider.request(UUApi.rankList, model: RankinglistModel.self) { returnData in
            self.tableView.uHead?.endRefreshing()
            self.tableView.uempty?.allowShow = true
            self.rankList = returnData?.rankinglist ?? []
            self.tableView.reloadData()
        }
    }

    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ ($0.edges.equalTo(self.view.usnp.edges)) }
    }
}

extension UURankListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UURankTabCell.self)
        cell.model = rankList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UUScreenWidth * 0.4
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = rankList[indexPath.row]
//        let vc = UUComicListViewController(argCon: model.argCon,
//                                          argName: model.argName,
//                                          argValue: model.argValue)
//        vc.title = "\(model.title!)榜"
//        navigationController?.pushViewController(vc, animated: true)
    }
}
