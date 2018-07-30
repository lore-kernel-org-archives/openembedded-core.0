Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 345EC78D17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 03:31:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6U3Vgov019759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 20:31:42 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 29 Jul 2018 20:31:41 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1532078657-63235-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <e2298915-ae9b-f56e-7694-0b24481becd0@windriver.com>
Date: Mon, 30 Jul 2018 11:33:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532078657-63235-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta][PATCH v2] fix the failure test_trace_events of ksample.py
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
X-List-Received-Date: Mon, 30 Jul 2018 03:31:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

--Hongzhi


On 2018年07月20日 17:24, Hongzhi.Song wrote:
> v2:
>      assert failure when timeout
>
> Hongzhi.Song (1):
>    runtime selftest: test_trace_events_sample of ksample.py
>
>   meta/lib/oeqa/runtime/cases/ksample.py | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>


