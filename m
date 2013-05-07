Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UZkKQ-0002GL-HO
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:01:25 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D12E8F811DB; Tue,  7 May 2013 09:43:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 677E8F8119A;
	Tue,  7 May 2013 09:43:19 -0600 (MDT)
Message-ID: <5189211B.6050905@mlbassoc.com>
Date: Tue, 07 May 2013 09:43:23 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1367240260.14512.120.camel@phil-desktop.brightsign>
	<518919FE.9000004@mlbassoc.com>
	<CAJTo0Lb1TW9gOW79fbDdqyn61-tvxW+Fh1aQxf+mLuGRUhv0RA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1TW9gOW79fbDdqyn61-tvxW+Fh1aQxf+mLuGRUhv0RA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 16:01:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-07 09:23, Burton, Ross wrote:
> On 7 May 2013 16:13, Gary Thomas <gary@mlbassoc.com> wrote:
>> It looks like the package(s) you're referring to are the X server.
>> Too bad you didn't provide those patches as well as images which
>> use X are currently broken (at least mine are)
>
> Yeah, I noticed that when browsing mail over breakfast but dropped the
> ball in actually saying on the list.  Add a dependency to it in
> xserver-xorg.

I'll put something together shortly.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


