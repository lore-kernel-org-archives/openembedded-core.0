Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69C6379974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 02:26:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8E2PBpi018822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 19:25:57 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Sep 2018 19:25:17 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tom Rini <trini@konsulko.com>
References: <1536291131-24332-1-git-send-email-lu.jiang@windriver.com>
	<1536291131-24332-2-git-send-email-lu.jiang@windriver.com>
	<20180907115632.GH26633@bill-the-cat>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <5429001a-09e9-8310-1332-0808118ee1f2@windriver.com>
Date: Fri, 14 Sep 2018 10:23:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180907115632.GH26633@bill-the-cat>
X-Originating-IP: [128.224.162.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic:mkefidisk:add use-uuid for all partitions
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
X-List-Received-Date: Fri, 14 Sep 2018 02:26:42 -0000
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi all,

Since the patch is reviewed, do I need send a pull-request for this?

Thanks
Jiang Lu

在 2018年09月07日 19:56, Tom Rini 写道:
> On Fri, Sep 07, 2018 at 11:32:11AM +0800, Jiang Lu wrote:
>
>> Add use-uuid for all partitions on mkefidisk.wks.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>
>


