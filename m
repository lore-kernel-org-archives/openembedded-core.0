Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6D077F23C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:42:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T3fvkg000586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 28 Sep 2019 20:41:57 -0700 (PDT)
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 28 Sep 2019 20:41:45 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1569582526.git.liezhi.yang@windriver.com>
	<11bd4264e2d1372d86ed1f95dbebb81ad9876a2a.1569582526.git.liezhi.yang@windriver.com>
	<ad3b56ec-8724-8d5c-4623-c95590ff0734@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <195102cb-03f2-dae4-adf8-26bf0600e0c9@windriver.com>
Date: Sun, 29 Sep 2019 11:41:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad3b56ec-8724-8d5c-4623-c95590ff0734@intel.com>
Subject: Re: [PATCH 1/1] lttng-ust: Fix for --enable-python-agent
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
X-List-Received-Date: Sun, 29 Sep 2019 03:42:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/27/19 8:55 PM, Ross Burton wrote:
> On 27/09/2019 12:09, Robert Yang wrote:
>> +Upstream-Status: Pending
> 
> Can you send this upstream? It's on GitHub so is just a pull request away.

Thanks, I submitted it just now and updated patch message in the PULL:

Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/59]

// Robert

> 
> Ross

