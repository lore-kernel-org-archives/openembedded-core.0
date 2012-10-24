Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1TR20o-0006qa-Qd; Wed, 24 Oct 2012 16:32:50 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so736120ieb.6
	for <multiple recipients>; Wed, 24 Oct 2012 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8hfkTzpgb3EblSgZdY51Y1YnZ1TCXrkx05ABqC8vyfI=;
	b=Uf7e/XyDa8fxJirMpSqQcmVKXaqVkvDKP/apNqeCBj718nfuBggyIZv+mqapLn1HoQ
	fIeBolbmdtPic7lY3omAxKvvMW6MQVSkM85cMSyb1jI+BtLJuxcOgOjjekKBGFqXYl1C
	RsTeyhhVh58+Mohf/A745XL7gRCeCqCISJd68RU6nFJkPj/xvXCxDGNyUrHcr/CoCTCK
	zw675aM1hReP8OQPiscWxRML1X4zXUmggu4eH3eXBxYP+tJ02SygrtGr2o7PvQx0sJpe
	4kEY7DvA5FEBFRP1RYr/paO1+0EodXC/9WBxAfOzKxe0zI5kRUyTBr6yMcT5bL3gORQJ
	rGrw==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr1096751igc.31.1351088362722; Wed,
	24 Oct 2012 07:19:22 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Wed, 24 Oct 2012 07:19:22 -0700 (PDT)
Date: Wed, 24 Oct 2012 16:19:22 +0200
Message-ID: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: Latest head causes challanges
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
X-List-Received-Date: Wed, 24 Oct 2012 14:32:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I updated my layers this morning. Since that I have huge fallout:
Poking around I found /usr/libexec is missing on my machine. Any idea
what might caused this?

Andreas


