Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E29D078400
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 02:24:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w112ODiJ002292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 31 Jan 2018 18:24:16 -0800
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 18:24:12 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<ec85ad1d59af3b628e885b63624f611affbfeb5e.1517383469.git.hongxu.jia@windriver.com>
	<b9238af1-23a0-4e71-3188-c0be9f92e9f9@linux.intel.com>
	<b96c9baf-4817-52a5-bb22-ba10f4e553f9@windriver.com>
	<d077472e-a6ea-9b78-31b8-2ee5e42f5267@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <72c0e55a-f317-aa60-0681-9be5ea41a549@windriver.com>
Date: Wed, 31 Jan 2018 21:24:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <d077472e-a6ea-9b78-31b8-2ee5e42f5267@linux.intel.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH 2/7] pigz: 2.3.4 -> 2.4
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
X-List-Received-Date: Thu, 01 Feb 2018 02:24:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-31 03:27 AM, Alexander Kanavin wrote:
> You need to mention this in the commit message.

Also explain why the md5sum for LIC_FILES_CHKSUM changed
in the commit log.

../Randy

> 
> I still wonder why patchtest won't tell that anymore; we changed it to 
> look for a tag, and somehow that isn't working :(
> 
> Alex


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

