Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B80CA7147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 01:07:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S17MTb029235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Jan 2015 17:07:22 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 17:07:21 -0800
Message-ID: <54C83648.1060907@windriver.com>
Date: Wed, 28 Jan 2015 09:07:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <54C759CD.1030905@windriver.com> <20150127151830.GA2477@jama>
In-Reply-To: <20150127151830.GA2477@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About subversion_1.8.10.bb and subversion_1.6.15.bb
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
X-List-Received-Date: Wed, 28 Jan 2015 01:07:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/27/2015 11:18 PM, Martin Jansa wrote:
> On Tue, Jan 27, 2015 at 05:26:37PM +0800, Robert Yang wrote:
>>
>> We have both subversion_1.8.10.bb and subversion_1.6.15.bb in oe-core
>> layer, and their license are the same (Apache-2), does anyone know why
>> we need keep subversion_1.6.15.bb, please ? I'd like to remove the old
>> one if no objections.
>
> Different checkout format.

Thanks, so I think that we need keep subversion_1.6.15.bb ?

// Robert

>

