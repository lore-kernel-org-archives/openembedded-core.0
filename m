Return-Path: <De.Huo@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3146156E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 04:01:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01J41jZl008792
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Feb 2020 20:01:45 -0800 (PST)
Received: from [128.224.16.214] (128.224.16.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 18 Feb 2020 20:01:45 -0800
To: <chet.ramey@case.edu>, Phil Reid <preid@electromag.com.au>,
	"akuster808@gmail.com" <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
From: dhuo <de.huo@windriver.com>
Message-ID: <3a9468a2-ab8b-fbb0-50ad-37d3eb6f6e28@windriver.com>
Date: Wed, 19 Feb 2020 12:01:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
X-Originating-IP: [128.224.16.214]
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 19 Feb 2020 04:01:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

Do you know how to reproduce this isse on my side?

Since we also provide this patch in our current WRLinux product.

Thanks in advance.

在 2020/2/18 23:28, Chet Ramey 写道:
> On 2/17/20 9:46 PM, Huo, De wrote:
>>   I applied the patch to fix CVE defect CVE-2019-18276.
> That's not exactly an answer to the question of who produced the patch.
> If that patch is the one causing failures when it's applied, doesn't it
> make sense to go back to the person who produced it and ask them to
> update it if necessary?
>

