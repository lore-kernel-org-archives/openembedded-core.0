Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0B07B60721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:36:34 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 2094468A01C; Thu, 28 Jul 2016 10:36:34 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 7FD5768A019;
	Thu, 28 Jul 2016 10:36:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 327266740160;
	Thu, 28 Jul 2016 11:36:33 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
References: <1469657668-8150-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<CAJTo0LYAUORccSVvnfab1zpdS9HqdMenmfETq6c7SN2sqQJY-Q@mail.gmail.com>
Message-ID: <5799D221.1020807@mlbassoc.com>
Date: Thu, 28 Jul 2016 11:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYAUORccSVvnfab1zpdS9HqdMenmfETq6c7SN2sqQJY-Q@mail.gmail.com>
Subject: Re: [PATCH v2] python-setuptools: Upgrade to v 25.1.0
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
X-List-Received-Date: Thu, 28 Jul 2016 09:36:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-28 11:32, Burton, Ross wrote:
>
> On 27 July 2016 at 23:14, Alejandro Hernandez <alejandro.hernandez@linux.intel.com
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     -LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
>     +LIC_FILES_CHKSUM = "file://setup.py;beginline=155;endline=155;md5=3e8df024d6c1442d18e84acf8fbbc475"
>
>
> Please explain why the license checksum was changed.

In this case, the actual license checksum is the same, it
was just moved down in the file (and seemingly the lines
before are not relevant to the license).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

