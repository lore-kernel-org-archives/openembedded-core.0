Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UdMT8-0007qx-VT
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 17:21:24 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1DA0EF8124D; Fri, 17 May 2013 09:03:03 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 710C9F8124D;
	Fri, 17 May 2013 09:03:01 -0600 (MDT)
Message-ID: <519646A8.9080204@mlbassoc.com>
Date: Fri, 17 May 2013 09:03:04 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <51962FFE.3040202@mlbassoc.com> <51963C52.1040004@linux.intel.com>
	<51963D78.8010908@mlbassoc.com>
	<CAJTo0La=GUsgnsxw0QLT4OhgDkqFYTte4cRvYtrCsKfF9D1kJg@mail.gmail.com>
In-Reply-To: <CAJTo0La=GUsgnsxw0QLT4OhgDkqFYTte4cRvYtrCsKfF9D1kJg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
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
X-List-Received-Date: Fri, 17 May 2013 15:21:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-17 08:32, Burton, Ross wrote:
> On 17 May 2013 15:23, Gary Thomas <gary@mlbassoc.com> wrote:
>> Master, updated 2013-05-16
>
> Definitely worth updating again, there were some incompatibility with
> Python 2.6 that were fixed yesterday.

No change, sorry.  This only happens when 'git' is not installed
and is very easy to reproduce.

I tested on Ubuntu 12.04 and Fedora 17

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


