Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRkJU-0006za-Kd
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 15:51:04 +0200
Received: from localhost ([127.0.0.1]:59185 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRk6Q-0005Gz-Ov
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 13:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=ITQVSUKaYyTH5li6z1OSreSRye8=; b=w8dQAfxB3naq2nEIl/zl2UHngkYi
	SZgDZIKJAMP/Ig3JP5KF19T3riaOTkYDc2sBuYr+SwcPx7f/DsEYme2f/n/UjR/a
	43vUYm9EkVWnUnYWOiJkvrGHIn5gu5FO1IKOX5tv/qWJzczwnq6xjmOrkeHz/mEG
	m9Xg+i1r/S/ERwI=
Received: from [195.171.99.130] (port=40962 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRk6Q-0005Gv-Ld
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 13:37:34 +0000
Message-ID: <508A9286.5030603@communistcode.co.uk>
Date: Fri, 26 Oct 2012 14:39:18 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
	<1351258645-14649-2-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1351258645-14649-2-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCH 1/3] latencytop: disable GTK and remove gtk+ dependacy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 13:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Apologies for the double send - I don't know why this second set came 
through!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



