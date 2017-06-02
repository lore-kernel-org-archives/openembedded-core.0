Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 893F177E31
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 00:00:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5200HBL019609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Jun 2017 17:00:17 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 17:00:17 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Zheng Ruoqin
	<zhengrq.fnst@cn.fujitsu.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
	<6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
Message-ID: <501d2419-3401-4c9f-e80d-b2c33e2b01bc@windriver.com>
Date: Thu, 1 Jun 2017 20:00:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 08/11] libunwind: update to 1.2
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
X-List-Received-Date: Fri, 02 Jun 2017 00:00:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-05-31 09:57 PM, Randy MacLeod wrote:
> I'll send that change tomorrow unless there's new from upstream
> or someone has a better idea.

Upstream is going to release a new tarball "soon"

    On 2017-06-01 12:18 PM, Dave Watson wrote:
    > The fix is in v1.2-stable and master, of which the next releases
    > will be v1.2.1 and v1.3, neither of which have been released yet.
    > I haven't seen any other fixes to go in v1.2.1 for a while, so
    > I'll roll that one out shortly.  Thanks


so I'll wait for that since it's been a month and no one else
has reported the mips* build failures.
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

