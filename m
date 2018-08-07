Return-Path: <fabien.lahoudere@collabora.co.uk>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Aug 2018 08:35:07 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 5077E6E650
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 08:35:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id EAC5D260F44
Message-ID: <1533630587.8352.1.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Tue, 07 Aug 2018 10:29:47 +0200
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Extract GPL sources
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
X-List-Received-Date: Tue, 07 Aug 2018 08:35:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello

I need to extract all *GPL* sources patched related to an image in order to publish them.
I want to do it automatically, ie 'bitbake myimage -c extract-gpl-sources'
Is there a mechanism to do that?
If not do you have any idea how I can implement it?

Thanks

-- 
Fabien

