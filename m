Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SF49a-0007jf-Bc
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 15:52:10 +0200
Received: by lagw12 with SMTP id w12so4542001lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vNky9kr3XMHlERIRuOKKGCA3USC2uLbM/IA2GJ/PV4A=;
	b=Ra0kpDzSC5Z53wtgIpHuZ4/IMqkQRTEW9ufa+/Qokyg+6XJazDie8kpSDqmpMrgsj6
	RByeG7tG/xgUTTVXKvYfGl/m95g8O5QorVZl7sIcbG2uy8Z2yL4wPWrB9PDZA4Y0zNAN
	SXbnM0OQcrfOP6n2aj3/r+wayL6J1qNjQs4LRUqdwNZDxCM136d7SknwB6nzdFYCorKm
	qk68sLJbbVA08+7XlNy1yABFpSm0E1cVEacls1Nf0DF3znWIxZw8WVz8/WvVIM5QEIwM
	toAR1+7ItwAjA6HiGgwZ5hWpnWyB48voYXbyNb/eRM0i9Qglr6sYywpom3QLZXl3J34y
	mKsw==
Received: by 10.152.111.198 with SMTP id ik6mr6291546lab.38.1333460580838;
	Tue, 03 Apr 2012 06:43:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 3 Apr 2012 06:42:30 -0700 (PDT)
In-Reply-To: <4F7AADA3.1020603@communistcode.co.uk>
References: <4F4B890D.90809@communistcode.co.uk>
	<4F61C5DF.8090705@communistcode.co.uk>
	<20120402165615.GB24832@sakrah.homelinux.org>
	<4F7AADA3.1020603@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Apr 2012 06:42:30 -0700
Message-ID: <CAMKF1soCWnGaZJ0iv=k7MHMxYgyyDeCZQ3kesxvOh4GFYGvcdA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cpufrequtils do_install issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 13:52:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 3, 2012 at 12:58 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
> For the record the new kid on the block in this area is called 'cpupower' it
> builds on cpufrequtils and brings it up to date (last cpufrequtils commit
> was sometime in 2009 if I remember correctly!) and is much better. If anyone
> is attempting to use cpufrequtils I would recommend checking it out instead.

if you have cpupower recipes for OE I would encourage you to contribute


