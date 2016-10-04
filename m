Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8C1D65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 16:22:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u94GMvps006153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2016 09:23:00 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 4 Oct 2016 09:22:57 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<CAFkk2KR5AB_gjq5XKFBJjOaaRHJ3DzJdCqS5H1Kq=m35xZ3jTQ@mail.gmail.com>
	<CAFkk2KSmxkEXxboJADHonFExX7F+vsc1o3Dga53bm3hdt7H2nA@mail.gmail.com>
	<1780562.gdzQvQrqZ4@peggleto-mobl.ger.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b712b5e2-a8df-5520-900c-2ff543619304@windriver.com>
Date: Tue, 4 Oct 2016 12:22:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1780562.gdzQvQrqZ4@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Tue, 04 Oct 2016 16:23:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-02 03:37 PM, Paul Eggleton wrote:
>> "native" might be a bit too generic...
>> > >>
>> > >> could I suggest oe_native-run or bitbake-native ?
>> > >>
>> > >> something that says it's yocto-galaxy specific and can be autocompleted
>> > >> with a reasonable prefix...
>> >

I also prefer an oe prefix.
oe-native, oe-run-native, or oe-exec-native would work for me.


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

