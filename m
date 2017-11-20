Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 970137865B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:58:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAKJwulw017658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:58:56 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 11:58:55 -0800
To: <openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<f098c01a598f8d4fc296fb408883040bd8bdc1d1.1510275834.git.liezhi.yang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <14532d98-9cfc-341a-e6fe-d3de11fd7d8d@windriver.com>
Date: Mon, 20 Nov 2017 14:58:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f098c01a598f8d4fc296fb408883040bd8bdc1d1.1510275834.git.liezhi.yang@windriver.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH 09/23] staging.bbclass: print searched manifest when not found
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
X-List-Received-Date: Mon, 20 Nov 2017 19:58:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-11-10 01:27 AM, Robert Yang wrote:
> The old warning was:
> WARNING: lib32-wrlinux-image-glibc-small-1.0-r1 
Please use a public image like core-image-minimal
rather than an internal one in your long log.

../Randy


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

