Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAC960043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:16:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w669Gj5f006202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2018 02:16:45 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 6 Jul 2018 02:16:44 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1530867788.git.hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <48b7dc21-5288-57dc-7488-b687e79baafe@windriver.com>
Date: Fri, 6 Jul 2018 17:18:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1530867788.git.hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [PATCH V2 0/2] kernel-selftest: add it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2018 09:16:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

please ignore it.

// Hongzhi


On 2018年07月06日 17:07, Hongzhi.Song wrote:
> The following changes since commit 611013a23a0082faa4fda2cd2529668965586a76:
>
>    mesa: add lost Upstream-Status tag (2018-07-05 00:22:08 +0100)
>
> are available in the git repository at:
>
>    https://github.com/csqshz/openembedded-core.git hong/kself
>    https://github.com//tree/hong/kself
>
> Dengke Du (1):
>    kernel-selftest: add it
>
> Hongzhi.Song (1):
>    kernel-selftest: add vm testcase to recipe
>
>   .../kernel-selftest/kernel-selftest.bb             | 94 ++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
>   2 files changed, 95 insertions(+)
>   create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
>


