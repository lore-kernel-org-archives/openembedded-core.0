Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqnaQ-0002B5-R0
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 17:24:22 +0100
Received: by mail-la0-f53.google.com with SMTP id fn20so8214710lab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=ONzZ1fyH13dNpuTAY4ywNYdloVDz/18HGkQEupMSotY=;
	b=SQJLwm3KaWexy//A9zY82V9b74dD9P7MfyepTX0UOkfZgGIM/clJ5Th0uPW3Spm7iM
	rJK0JgG+3/w8Q5dhH69Acoz8jHLbylCDC4izbqPHXhkPBpVylsWWXoE05jxbTolW4Tac
	2SSQi6ghQsyi0LEUQ50/PsM5rKJC4o8oAfV+DjZ2+r6vZMMy6UU62Ws/1HC3G+8Nsl4F
	zfVbzby4Mh4gFr0lQoBhg+w1uFl2ugnzfHRKlBfro7uCjmS8EqrvBEYy8P/4Cjw+hw4I
	lWVqrKonpLuxOkevvwXbQ4SA+6cHm5OWW9lSuFdV3iHwk1y1/DixWxtZgxScsC0UQ7Ul
	EoPA==
X-Received: by 10.152.108.172 with SMTP id hl12mr47008652lab.32.1357229342960; 
	Thu, 03 Jan 2013 08:09:02 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ne2sm18563662lab.10.2013.01.03.08.09.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 08:09:02 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TqnLn-0002lo-Pd
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 18:08:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 18:08:57 +0200
Message-Id: <1357229338-11959-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Pango update
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
X-List-Received-Date: Thu, 03 Jan 2013 16:24:22 -0000

[PATCH] pango: update to upstream version 1.32.5

Depends on HarfBuzz for which first version had been sent as
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-December/033607.html


 - ML


