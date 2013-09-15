Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7422760FF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 15:03:01 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x12so2149485qcv.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TlUXfidjgfYSiLfdcMFtqxObo2os5se8NqbNZPa+ixw=;
	b=edN/vDGaFXVdBF4f8N6yPbciQmjP8mK3Sk5PMZI14nohDZfrli3edirxmxTz3T5MLF
	b+juET/YuhBPdsDMkxuwpCH6JwMZuvw2+BdcZOLW61bATgetLoWmIiRLefG28CoULYBj
	Q6oUJfoHg5GJEfcy6jKi59q/E89WOWbwP8Cx8qlwh45D8L5xhAyeEnUhcBMO6OKfwr6+
	crh/QbPz7cgy7qjxj6QI9ukGzviOAkU6dKlMb8C671n87cG3pUip1gDe7DQYHz0cg/M+
	cDimeZsYcJS9j9lZ2LfT4WnAf+kGJJZCZK2joAy15s/mKx9kllyTfPlCOQUsqW6Gzmsh
	XGxw==
MIME-Version: 1.0
X-Received: by 10.49.50.198 with SMTP id e6mr1894218qeo.76.1379257382123; Sun,
	15 Sep 2013 08:03:02 -0700 (PDT)
Received: by 10.49.108.39 with HTTP; Sun, 15 Sep 2013 08:03:02 -0700 (PDT)
Date: Sun, 15 Sep 2013 18:03:02 +0300
Message-ID: <CADV-EXFKZrRS5K-_dsxVe570Q3ESi6Oqg3muNXgfmgu6RttrPQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Patch for psplash
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
X-List-Received-Date: Sun, 15 Sep 2013 15:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I made a patch for psplash to work without mmap support.
How can I submit this patch to psplash repository?

Best regards,
Yevhen

