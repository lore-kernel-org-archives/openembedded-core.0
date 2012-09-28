Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THb17-00060B-KV
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:54:09 +0200
Received: by daks35 with SMTP id s35so686964dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=W/CzPQm2rwzOylt27lBAYZ6BIBYeHp5K82Y+PaV0fBk=;
	b=hLGc3BzfHc3uyJKB0V8TcuroomnbOEpWUuflQagdBuN7457Q25Y4nRVHwPval4HtnC
	wHffkXTEnlCrbYIxfiB3YP1THX66IlfDVCC3KkIhKXYRwqJzGLTUoFgi+gbnObTvX0eO
	+LEtj/SWPTRwh2QAWl0Xe0gIkFlO+erPWvU6Rt+Lu+wD+ZkKL1sacx0iBQL2rgyZATig
	OJ1MEiNZIQjFbh0VQmACbbXP7oHGAJ3RpqDUf5vK62Re7ewgs5X6u1sUR7KOS4RP09Z7
	kGhDv7xcjdn/tAFWf+y/2l98ZaTjEYMRE/F7sfn6ZFWojh2d6Ua39zE1VGydi+LkgFUT
	FBog==
Received: by 10.68.234.232 with SMTP id uh8mr20453059pbc.94.1348839675760;
	Fri, 28 Sep 2012 06:41:15 -0700 (PDT)
Received: from [172.23.6.32] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id o1sm5529015pax.21.2012.09.28.06.41.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 06:41:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1348828356.32611.34.camel@phil-desktop>
Date: Fri, 28 Sep 2012 06:41:14 -0700
Message-Id: <AD746491-C938-4CFC-8397-A0E6AF132595@gmail.com>
References: <1348803644-20961-1-git-send-email-raj.khem@gmail.com>
	<1348828356.32611.34.camel@phil-desktop>
To: Phil Blundell <philb@gnu.org>
X-Mailer: Apple Mail (2.1498)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Support enums in hash
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
X-List-Received-Date: Fri, 28 Sep 2012 13:54:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Sep 28, 2012, at 3:32 AM, Phil Blundell <philb@gnu.org> wrote:

> On Thu, 2012-09-27 at 20:40 -0700, Khem Raj wrote:
>> +Upstream-Status: Pending
>> +Singed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> The mental picture of a patch being singed off is kind of amusing, but I
> guess this was a typo.
> 

heh yes. Fat fingers, I will correct it next time.


> p.
> 
> 



