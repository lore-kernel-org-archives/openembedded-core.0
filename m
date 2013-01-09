Received: from mail-ie0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1TsyJX-0006Qg-0l; Wed, 09 Jan 2013 17:15:44 +0100
Received: by mail-ie0-f182.google.com with SMTP id s9so2282646iec.27
	for <multiple recipients>; Wed, 09 Jan 2013 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type; bh=I7uq/4yUkO7FGXHWyt1rb0kmZ/raVDaE3TEC6/Kmxf0=;
	b=XYdmwCQ/MDPewNNxXlryp/GUJRl3VOtvDeHF2NjeizaOy7iNoy6RTWWBU2w/DZV2Hl
	31TcFJ84g97/6aVHvBLndWyYu3so/DtR18poFfYBBaAz06bii8zNjc+2zDJyuITeNfRR
	M90QmIlJmBfQHOPY9E6PJXzJfETjzf8xs4u/6cICT1TLNHSJ3Daa5qleiz1yXP3vLp8J
	Uo3q5vSdOBgR+tnD0HtWyHxIujCLxYfuHyqli0Zeuky8SvrS2F9KB/FDb7Mc7NqVZGMO
	OqEQCY3tHNkAWPaQ1Wi46DWVKPqCp71+yWk5pUB//fDD2G7MxRd4BlQc+g2gOgJ3oVOt
	iAxw==
X-Received: by 10.50.13.173 with SMTP id i13mr2063064igc.93.1357747226228;
	Wed, 09 Jan 2013 08:00:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 07:59:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 07:59:55 -0800
Message-ID: <CAMKF1sqc+JrTwPMwaBQ2p2-v5SoVgWOoJ76TU6MHro6iYvAJXg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: locking down patchwork and wiki registrations
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
X-List-Received-Date: Wed, 09 Jan 2013 16:16:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi

We receive tonne of spam in form of registrations everyday and some of
bots have become smarted that they even activate their
profiles. It has to be manually deleted and its tedious. I would
therefore like to remove the 'register' link from pw front page
that will stop the spam as I have already experimented with it a bit.

Same is also true for wiki. We should make the registration process to
be manual since that will put some end to registration spam.

I am open to other ideas to stop spam without locking registrations.

The registrations will still happen but should be done manually.

Thanks
-Khem


