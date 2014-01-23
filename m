Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id B63246D02F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:40:56 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wo20so1369794obc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=myGwqeOOIVdN2Muvn3xeYt1IPbGWYCBOPcbTH8tbyCo=;
	b=nTP5bRkzl2K9cDaAJzVoWpFGcL6vgOXhRpr0/yWHRNsotK7q678dOHzfFCWyzOKzLP
	QaptdvAcJOk8z+H+FfOcopw4yYEEiv+uPum/XPo0pOfWNY9H3ZBoV+6qP3Xn+/rLpPt7
	3T+5/xWaQhVpnLBuFkRQiSaYwq2LQS9Ly7kl1amKRbGvaikn2xs9l2rvjB2bWvVxli00
	IFjcLcx56W/qAP1ilKgUsR83oSzFBshrFw7huqe3WHXlc45xZsq9gIYF9DanOlAYbOkO
	Ds37dPbhM7JpUx6RyfquEWaXBkvaPo3+QubYtYeklyyuM+G00nhNbov1j23qSnmIUXqd
	mrtg==
MIME-Version: 1.0
X-Received: by 10.60.47.116 with SMTP id c20mr114475oen.60.1390441257508; Wed,
	22 Jan 2014 17:40:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 17:40:57 -0800 (PST)
In-Reply-To: <1390419432-19402-1-git-send-email-koen@dominion.thruhere.net>
References: <1390419432-19402-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 22 Jan 2014 23:40:57 -0200
X-Google-Sender-Auth: PVgOBXt26HH6zln87_DAF3JM8wE
Message-ID: <CAP9ODKqK0W1-KpfPSOVzXYXre1LvNE3_FzuNnXBwOyqSxW4d8w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: split out ATI/AMD Radeon firmware
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
X-List-Received-Date: Thu, 23 Jan 2014 01:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 5:37 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

