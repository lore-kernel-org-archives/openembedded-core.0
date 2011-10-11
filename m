Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RDhpb-0007zJ-9a; Tue, 11 Oct 2011 21:17:39 +0200
Received: by ggnq1 with SMTP id q1so6057594ggn.6
	for <multiple recipients>; Tue, 11 Oct 2011 12:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yPAhnKwfhUJRc/+/HD41r/Ozwa+zuXNVViHEtJxDs5g=;
	b=Qwi91O1NS4tEoQkS3tXMgtCNGs3YSFJNITArzdCgj9pcQv/vwv5sb4oQNbH+W2ZZL+
	3ESR/g5b6QwpCTqa3YDWW1w1D+BYK+AFWyuokPa4SSUJgKzAAKXAQ2B2/n7hD4VZEAyd
	bmKZce3Pa9MpUBwLOcA8BLwBAEzAgXqg1fI2A=
MIME-Version: 1.0
Received: by 10.236.79.231 with SMTP id i67mr10968910yhe.33.1318360315735;
	Tue, 11 Oct 2011 12:11:55 -0700 (PDT)
Received: by 10.236.209.97 with HTTP; Tue, 11 Oct 2011 12:11:55 -0700 (PDT)
Date: Tue, 11 Oct 2011 15:11:55 -0400
Message-ID: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: git server move
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
X-List-Received-Date: Tue, 11 Oct 2011 19:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, we are moving git.openembedded.org to a new server.

SSH access on the old server has been disabled.  git:// still works there.

As soon as DNS propagates, SSH access will work with the new server.

Let me know if you see any problems.

SSH keys will likely change, so expect messages about that.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


