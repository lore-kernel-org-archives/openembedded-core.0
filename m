Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC477F4AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9G2634T014120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2019 19:06:04 -0700
Received: from [128.224.158.231] (128.224.158.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 15 Oct 2019 19:06:03 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191015084237.10090-1-Qi.Chen@windriver.com>
	<5b729d37-1844-1c79-801a-d2cdb8dc36ef@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9278460a-fe4c-9800-00cb-1709bb172142@windriver.com>
Date: Wed, 16 Oct 2019 10:21:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5b729d37-1844-1c79-801a-d2cdb8dc36ef@intel.com>
X-Originating-IP: [128.224.158.231]
Subject: Re: [PATCH] sqlite3: fix CVE-2019-16168
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
X-List-Received-Date: Wed, 16 Oct 2019 02:06:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2019 06:50 PM, Ross Burton wrote:
> There's a queued upgrade to 3.30 for master, is this fixed in that 
> release?
>
> Ross
>
No such problem in 3.30.
I've sent out a new patch tagged with '[zeus]'.

Regards,
Chen Qi

