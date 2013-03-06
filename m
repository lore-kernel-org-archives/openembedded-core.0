Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UDJ0J-0007Tg-Or
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 19:23:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r26I7JBC015811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2013 10:07:19 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 6 Mar 2013 10:07:19 -0800
Message-ID: <513785D5.6030302@windriver.com>
Date: Wed, 6 Mar 2013 12:07:17 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
	<20130304081846.GC3268@jama> <1362391887.29587.5.camel@ted>
	<CAMKF1spo15CEJUyq2sf9cHA=VMgdhOHVgeHGQ3EAsJzcY9q-9g@mail.gmail.com>
	<CAHUNapRRwtjCtfcAixq+vSt250Ep-jGPbeqv17SgRLRce-4r0g@mail.gmail.com>
In-Reply-To: <CAHUNapRRwtjCtfcAixq+vSt250Ep-jGPbeqv17SgRLRce-4r0g@mail.gmail.com>
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Wed, 06 Mar 2013 18:23:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/13 10:04 AM, Trevor Woerner wrote:
> Ah... so CQID is an internal WindRiver thing?

Correct.  This is our internal bug tracking number.  (Our customers also get 
access to some of the numbers as well..)

We include this number of items we've ported from our product back to oe-core so 
that when we uprev it is easier for us to verify that certain problems have been 
corrected.

If the community decided these numbers are not acceptable we'll stop including 
them.  (If you note, not all of our contributions include those numbers.. 
generally only bug fixes do.)

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



