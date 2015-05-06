Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31D6E73C8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:45:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t46FjwnF006732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 May 2015 08:45:58 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 6 May 2015 08:45:57 -0700
Message-ID: <554A3734.8000107@windriver.com>
Date: Wed, 6 May 2015 11:45:56 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <5547BE45.2050206@windriver.com>	<1430855489.8074.10.camel@linuxfoundation.org>
	<CAP9ODKo9WAzdRnZp0wtZJYK+5tN+CyTph4dzH2tgguuoXOBqPw@mail.gmail.com>
In-Reply-To: <CAP9ODKo9WAzdRnZp0wtZJYK+5tN+CyTph4dzH2tgguuoXOBqPw@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add libreSSL to oe-core?
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
X-List-Received-Date: Wed, 06 May 2015 15:45:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-05 04:05 PM, Otavio Salvador wrote:
> On Tue, May 5, 2015 at 4:51 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2015-05-04 at 14:45 -0400, Randy MacLeod wrote:
...
>> Certainly a recipe in meta-oe and someone experimenting with it would be
>> great and I've love to see the feedback and results but I'd be cautious
>> here for the core right now.
>>
>> Obviously it will be interesting to see if anyone else has strong
>> opinions though too.
>
> I share this very same view. Adding this to meta-oe seems more logical for now.
>

Thanks for the comments. That's my opinion as well so we'll
consider adding libressl to meta-oe but given what I've learned
so far, it's a low priority.
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

