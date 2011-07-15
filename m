Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1QhqEH-0005X2-V0; Fri, 15 Jul 2011 23:47:26 +0200
Received: by pzk5 with SMTP id 5so2645272pzk.3
	for <multiple recipients>; Fri, 15 Jul 2011 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=ekg3XEOrnFfx51xhkzgvy28RzxpBOPXFS83NVPKlTTM=;
	b=CppZGA/HUSHu9e+U/zu6eiad0VcjAvR+ubBG3qEnbyQKARpHyyu6GBpG36Bjz8p8GW
	iumdFNi1n1ek/ChscDY6yWtkIu3au/XqxN1iLZjYKE6qZ2a/EUjoViR+mXyLST4AWUJD
	k0DVn2ctAX7qufw841uogfq/9wmgEFUIm0IHA=
Received: by 10.68.14.98 with SMTP id o2mr5271298pbc.10.1310766204068; Fri, 15
	Jul 2011 14:43:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Fri, 15 Jul 2011 14:42:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2011 14:42:54 -0700
Message-ID: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Fri, 15 Jul 2011 21:47:26 -0000
Content-Type: text/plain; charset=UTF-8

Hello

As we all know that next release of OpenEmbedded is slated based on
oe-core, I would like to request submitters and committers of
the patches for oe.dev to port the patches to meta-oe or any other
layer that is suitable for a given patch. Any new recipes
being added to oe.dev should definitely go into the new layered structure

Please follow the commit guidelines for meta-oe/oe-core and submit the
appropriate pull requests so that when we cut out the next release we
don't miss any of those patches.

Thanks for your cooperation and help

-Khem


