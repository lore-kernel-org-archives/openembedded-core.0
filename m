Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 097037933C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 11:27:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8SBRfb8026426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 04:27:41 -0700 (PDT)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 28 Sep 2018 04:27:40 -0700
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180921060925.46930-1-hongzhi.song@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <fdb16a79-627a-dbdf-2ff4-654398705123@windriver.com>
Date: Fri, 28 Sep 2018 19:27:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921060925.46930-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH 0/1 V2] sigwaitinfo01: recent glibc calls syscall directly
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
X-List-Received-Date: Fri, 28 Sep 2018 11:27:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

Zhe

On 2018年09月21日 14:09, Hongzhi.Song wrote:
> v2:
>     modify the format of [Upstream-Status]
>
> Hongzhi.Song (1):
>   sigwaitinfo01: recent glibc calls syscall directly
>
>  ...nfo01-recent-glibc-calls-syscall-directly.patch | 75 ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
>


