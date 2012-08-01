Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Swb2y-0001gZ-5X
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:41:16 +0200
Received: by yhjj56 with SMTP id j56so6719910yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mn3lG2Gmf/eKtHumhWOWgttbZtmzFWrV6yPD37rcaZw=;
	b=0TEwGSjSiQ7DIm4W7KXl9zwrylKkQzB1oDj7HTtic3n0OXSj5AoBgl69FR8jwYfR+d
	96HJ0LdY1XXnyj1hN8FjqjNmQnsfAZixG7f+gKexXbPPp1EBiLXaJ5q/ffDbSguHdnkw
	v70DkHon8C3lcVipww1BvMMnZSHX1Pgvj2r1IHcz2mKNeOrR/DzflwlbUq6n1kssyLFi
	HAt4yxFJbK8YZshw+PnWj2o5g/tIQMcgXpGyR1EhED3BkYTz5GZ3kqFAk8gNcm/W5/tE
	z5oUXafzIvtTpeUfsECThvICdHE8PWj8BJKRy9JlnBzAf61uo0GeFo94Wa5LnSqb4gcW
	pqNQ==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr5896155igc.5.1343834977113; Wed,
	01 Aug 2012 08:29:37 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Wed, 1 Aug 2012 08:29:37 -0700 (PDT)
Date: Wed, 1 Aug 2012 17:29:37 +0200
Message-ID: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: number of tasks increased since last update
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
X-List-Received-Date: Wed, 01 Aug 2012 15:41:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

today I updated and found the the number of tasks has increased about
400. Another strange behaviour: in my build dir there are two new
folders:

x86_64-nativesdk-angstromsdk-linux
x86_64-angstromsdk-linux

but up to now I was not interested in sdk stuff. Is that another bug
or a feature?

Andreas


