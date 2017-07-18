Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 147D777E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:01:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I21Rw5022943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 19:01:28 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 19:01:27 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1499822461.git.kai.kang@windriver.com>
	<10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
	<e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <f136d49e-6409-fb63-0c07-a371392761f2@windriver.com>
Date: Tue, 18 Jul 2017 10:04:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
Subject: Re: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Tue, 18 Jul 2017 02:01:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月17日 21:38, Alexander Kanavin wrote:
> On 07/12/2017 11:40 AM, Kang Kai wrote:
>>> Kai Kang (1):
>>>    bind: 9.10..3-P3 -> 9.10.5-P3
>
> Why not 9.11.1?

If bind 9.11.x is needed, we could add its recipe. But I think the 
9.10.x version should be kept for compatibility.

Thanks,
Kai

>
> Alex
>

-- 
Regards,
Neil | Kai Kang


